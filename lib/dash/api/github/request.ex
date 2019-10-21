defmodule Dash.Api.Github.Request do
  @moduledoc "For calling GitHub API"
  alias Dash.Accounts.User
  alias Dash.Api.Github.FakeData
  use Retry

  # @doc "Recursively grabs all repositories,"
  # @spec all_repos(User.t(), any) :: []
  # def all_repos(user, address \\ "user/repos")

  # def all_repos(user, address) do
  #   %User{settings: %{github_username: username, github_api_token: token}} = user
  #   {headers, body} = get(address, username, token)

  #   case next_page(headers) do
  #     nil -> body
  #     next_address -> body ++ all_repos(user, next_address)
  #   end
  # end

  @doc "Recursively grabs all issues"
  @spec add_issues(User.t(), any) :: []
  def add_issues(user, address \\ "issues?per_page=1000&filter=all&page=1")

  def add_issues(user, address) do
    %User{settings: %{github_username: username, github_api_token: token}} = user
    {headers, body} = get(address, username, token)

    case next_page(headers) do
      nil ->
        body

      next_address ->
        body ++ add_issues(user, next_address)
    end
  end

  defp next_page(headers) do
    headers
    |> get_links()
    |> parse_links()
    |> filter_links()
  end

  defp get_links(nil), do: nil
  defp get_links(headers), do: Map.get(headers, "Link")

  defp parse_links(nil), do: nil

  defp parse_links(links) do
    ~r/<https:\/\/api.github.com\/(.+)>; rel="next"/
    |> Regex.run(links)
  end

  defp filter_links(nil), do: nil

  defp filter_links(links) do
    links
    |> Enum.reject(fn link -> String.contains?(link, "http") end)
    |> List.first()
  end

  def get(address, username, token) do
    key = "#{address}#{token}"

    case Cachex.fetch(
           :github,
           key,
           fn _ ->
             {:commit, do_get(address, username, token)}
           end
         ) do
      {:ok, result} ->
        result

      {:commit, result} ->
        Cachex.expire(:github, key, :timer.seconds(50))
        result

      {:error, _} ->
        result = do_get(address, username, token)
        Cachex.put(:github, key, result, ttl: :timer.seconds(50))
        result
    end
  end

  # make a get request to the Github API
  @spec do_get(String.t(), String.t(), String.t()) :: {any, any}
  def do_get(address, username, token) do
    case Application.get_env(:dash, :env) do
      :test ->
        {FakeData.headers(), FakeData.generate(address)}

      # coveralls-ignore-start
      _ ->
        headers = []
        address = "https://#{username}:#{token}@api.github.com/#{address}"
        options = [ssl: [{:versions, [:"tlsv1.2"]}], recv_timeout: 10_000]

        %{headers: headers, body: body} =
          retry with: exponential_backoff() |> cap(20_000) |> expiry(120_000),
                rescue_only: [HTTPoison.Error] do
            HTTPoison.get!(address, headers, options)
          after
            result -> result
          else
            error -> error
          end

        body = Poison.decode!(body)
        headers = Enum.into(headers, %{})

        {headers, body}
    end
  end

  # coveralls-ignore-stop
end

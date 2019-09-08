defmodule Dash.Api.Github.Request do
  @moduledoc "For calling GitHub API"
  alias Dash.Accounts.User
  alias Dash.Api.Github.FakeData
  use Retry

  @spec all_repos(User.t(), any) :: []
  def all_repos(user, address \\ "user/repos")

  def all_repos(user, address) do
    %User{settings: %{github_username: username, github_api_token: token}} = user
    {headers, body} = get(address, username, token)

    case next_page(headers) do
      nil -> body
      next_address -> body ++ all_repos(user, next_address)
    end
  end

  @spec add_issues(User.t(), any) :: []
  def add_issues(user, address \\ "issues")

  def add_issues(user, address) do
    %User{settings: %{github_username: username, github_api_token: token}} = user
    {headers, body} = get(address, username, token)

    case next_page(headers) do
      nil -> body
      next_address -> body ++ add_issues(user, next_address)
    end
  end

  defp next_page(headers) do
    links = Map.get(headers, "Link")

    case links do
      nil ->
        nil

      links ->
        ~r/<(.+)>; rel="next",/
        |> Regex.run(links)
        |> Enum.at(1)
    end
  end

  # make a get request to the Github API
  @spec get(String.t(), String.t(), String.t()) :: {any, any}
  def get(address, username, token) do
    case Application.get_env(:dash, :env) do
      :test ->
        {FakeData.headers(), FakeData.generate(address)}

      # coveralls-ignore-start
      _ ->
        headers = []
        address = "https://#{username}:#{token}@api.github.com/#{address}"
        options = [ssl: [{:versions, [:"tlsv1.2"]}], recv_timeout: 2000]

        %{headers: headers, body: body} =
          retry with: exponential_backoff() |> cap(1_000) |> expiry(10_000),
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
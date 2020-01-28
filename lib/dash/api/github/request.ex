defmodule Dash.Api.Github.Request do
  @moduledoc "For calling GitHub API"
  alias Dash.Accounts.User
  alias Dash.Api.Github.{FakeData, Issues}
  use Retry

  @spec get_issues(User.t()) :: {:ok, Issues.t()}
  def get_issues(user) do
    case add_issues(user) do
      {:error, message} -> {:error, message}
      response -> {:ok, %Issues{response: response, user: user}}
    end
  end

  @doc "Recursively grabs all issues"
  @spec add_issues(User.t(), any) :: [map]
  def add_issues(user, address \\ "issues?per_page=1000&filter=all&page=1")
  def add_issues(_user, nil), do: []

  def add_issues(user, address) do
    %User{settings: %{github_username: username, github_api_token: token}} = user

    case get(address, username, token) do
      {:ok, headers, body} ->
        next_address = next_page(headers)
        body ++ add_issues(user, next_address)

      {:error, message} ->
        {:error, message}
    end
  end

  defp next_page(headers) do
    headers
    |> get_links()
    |> parse_links()
    |> filter_links()
  end

  defp get_links(headers), do: Map.get(headers, "Link")

  defp parse_links(nil), do: nil

  defp parse_links(links) do
    ~r/<https:\/\/api.github.com\/(.{20,40})>; rel="next"/
    |> Regex.run(links)
  end

  defp filter_links(nil), do: nil

  defp filter_links(links) do
    links
    |> Enum.reject(fn link -> String.contains?(link, "http") end)
    |> List.first()
  end

  # make a get request to the Github API
  @spec get(String.t(), String.t(), String.t()) :: {any, any}
  def get(address, username, token) do
    case Application.get_env(:dash, :env) do
      :test ->
        {:ok, FakeData.headers(), FakeData.generate(address)}

      # coveralls-ignore-start
      _ ->
        headers = []
        address = "https://#{username}:#{token}@api.github.com/#{address}"
        options = [ssl: [{:versions, [:"tlsv1.2"]}], recv_timeout: 10_000]

        with {:ok, response} <- HTTPoison.get(address, headers, options),
             {:ok, headers} = Map.fetch(response, :headers),
             {:ok, body} = Map.fetch(response, :body),
             {:ok, body} <- Poison.decode(body),
             headers <- Enum.into(headers, %{}) do
          {:ok, headers, body}
        else
          error -> error
        end
    end
  end

  # coveralls-ignore-stop
end

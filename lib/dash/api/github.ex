defmodule Dash.Api.Github do
  @moduledoc "Queries the GitHub API"
  alias Dash.Accounts.User
  alias Dash.Api.Github.{Issues, Process, Request}

  @spec issues(User.t()) :: {:ok, [map]} | {:error, binary}
  def issues(%User{settings: %{github_username: username, github_api_token: token}} = user)
      when is_binary(username) and is_binary(token) do
    issues =
      %Issues{}
      |> Map.put(:response, Request.add_issues(user))
      |> Process.issues(user)

    {:ok, issues}
  end

  def issues(_), do: {:error, "Invalid user information"}

  @spec has_github?(User.t()) :: boolean
  def has_github?(%User{settings: %{github_username: username, github_api_token: token}})
      when is_binary(username) and is_binary(token),
      do: true

  def has_github?(%User{}), do: false
end

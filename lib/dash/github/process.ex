defmodule Dash.Github.Process do
  @moduledoc """
  Processes Github API response to only extract the keys/data that we want
  """
  alias Dash.Github.User

  @spec issues([map] | nil, User.t()) :: {:ok, [map]} | {:error, binary}
  def issues(nil, _user) do
    {:error, "No response to process"}
  end

  def issues(issues, user) do
    {:ok, Enum.filter(issues, fn issue -> filter_issues(issue, user) end)}
  end

  # Keeps the issue if assigned or is a pull request
  defp filter_issues(issue, %User{settings: %{github_username: username}}) do
    issue
    |> Map.get("assignees", [])
    |> Enum.map(fn assignee -> Map.get(assignee, "login") end)
    |> Enum.member?(username)
  end
end

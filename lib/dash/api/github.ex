defmodule Dash.Api.Github do
  @moduledoc "Queries the GitHub API"
  alias Dash.Accounts.User
  alias Dash.Api.Github.{Credentials, Process, Request}

  @spec issues(User.t()) :: {:ok, [map]} | {:error, binary}
  def issues(user) do
    with :ok <- Credentials.exist?(user),
         {:ok, issues} <- Request.get_issues(user),
         {:ok, issues} <- Process.issues(issues) do
      {:ok, issues}
    else
      error -> error
    end
  end
end

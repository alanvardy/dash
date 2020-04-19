defmodule Dash.Github do
  @moduledoc "Queries the GitHub API"
  alias Dash.Accounts.User
  alias Dash.Github.{Credentials, Process, Request, Server}

  @spec issues(User.t()) :: {:ok, [map]} | {:error, binary}
  def issues(user) do
    with :ok <- Credentials.exist?(user),
         {:ok, issues} <- Request.get_issues(user),
         {:ok, issues} <- Process.issues(issues) do
      {:ok, issues}
    else
      {:error, message} -> {:error, message}
    end
  end

  defdelegate fetch(user_id), to: Server
  defdelegate update(pid, user_id), to: Server
end

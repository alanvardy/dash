defmodule Dash.Github do
  use Boundary, deps: [Dash.{Accounts, Repo}], exports: []
  @moduledoc "Queries the GitHub API"

  alias Dash.Accounts.User
  alias Dash.Github.{Credentials, Process, RateLimit, Request, Server}

  @spec issues(User.t()) :: {:ok, [map]} | {:error, binary}
  def issues(user) do
    with :ok <- Credentials.exist?(user),
         :ok <- RateLimit.check_remaining(user),
         {:ok, issues} <- Request.get_issues(user),
         {:ok, issues} <- Process.issues(issues, user) do
      {:ok, issues}
    else
      {:error, message} -> {:error, message}
    end
  end

  @spec fetch(pos_integer) :: nil | [map]
  defdelegate fetch(user_id), to: Server
  @spec update(atom | pid | {atom, any} | {:via, atom, any}, any) :: :ok
  defdelegate update(pid, issues), to: Server
end

defmodule Dash.Api.Github.Server do
  @moduledoc "For handling and storing requests to the GitHub API"
  use GenServer
  alias Dash.Accounts.User
  alias Dash.Api.Github.Requester
  alias Dash.Repo
  import Ecto.Query

  @doc "Create GenServer, make sure user exists"
  def init(%{id: id}) do
    case get_user(id) do
      {:ok, user} ->
        GenServer.start_link(Requester, %{parent: self(), user: user})
        {:ok, %{issues: nil}}

      {:error, :not_found} ->
        {:stop, "User does not exist"}
    end
  end

  def handle_call(:issues, _from, %{issues: issues} = state) do
    {:reply, issues, state}
  end

  def handle_cast({:update_issues, issues}, state) do
    {:noreply, %{state | issues: issues}}
  end

  # HELPERS

  defp get_user(id) do
    case Repo.one(from(u in User, where: u.id == ^id, preload: [:settings])) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end

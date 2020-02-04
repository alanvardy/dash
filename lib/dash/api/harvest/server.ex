defmodule Dash.Api.Harvest.Server do
  @moduledoc "For handling and storing requests to the GitHub API"
  use GenServer
  alias Dash.Accounts.User
  alias Dash.Api.Harvest.Requester
  alias Dash.Repo
  import Ecto.Query
  require Logger

  @doc "Create GenServer, make sure user exists"
  def init(%{id: id}) do
    case get_user(id) do
      {:ok, user} ->
        GenServer.start_link(Requester, %{parent: self(), user: user})
        {:ok, %{reports: nil}}

      {:error, :not_found} ->
        {:stop, "User does not exist"}
    end
  end

  def handle_call(:reports, _from, %{reports: reports} = state) do
    {:reply, reports, state}
  end

  def handle_cast({:update_reports, reports}, state) do
    {:noreply, %{state | reports: reports}}
  end

  @doc "For catching unknown messages"
  def handle_info(message, state) do
    Logger.error(
      "Received unknown message in #{__MODULE__} \nMESSAGE: #{inspect(message)}\n STATE: #{
        inspect(state)
      }"
    )

    {:noreply, state}
  end

  # HELPERS

  defp get_user(id) do
    case Repo.one(from(u in User, where: u.id == ^id, preload: [:settings])) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end

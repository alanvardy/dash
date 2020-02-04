defmodule Dash.Api.Harvest.Server do
  @moduledoc "For handling and storing requests to the Harvest API"
  use GenServer
  require Logger
  alias Dash.Accounts.User
  alias Dash.{Api, Repo}
  import Ecto.Query

  # 30 Seconds
  @refresh_time 30_000

  @doc "Create GenServer, make sure user exists"
  def init(%{id: id}) do
    case get_user(id) do
      {:ok, user} ->
        Process.send_after(self(), :tick, 0)
        state = %{id: id, user: user, harvest: nil}
        {:ok, state}

      {:error, :not_found} ->
        {:stop, "User does not exist"}
    end
  end

  def handle_info(:tick, %{user: user} = state) do
    Process.send_after(self(), :tick, @refresh_time)

    case Api.get_harvest(user) do
      {:ok, harvest} ->
        {:noreply, %{state | harvest: harvest}}

      {:error, message} ->
        Logger.error("Harvest server error in #{__MODULE__}: #{inspect(message)}")
        {:noreply, state}
    end
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

  @doc "Calling for info from the GenServer resets the cycles"
  def handle_call(:harvest, _from, %{harvest: nil} = state) do
    {:reply, nil, state}
  end

  def handle_call(:harvest, _from, %{harvest: harvest} = state) do
    {:reply, harvest, state}
  end

  # HELPERS

  defp get_user(id) do
    case Repo.one(from(u in User, where: u.id == ^id, preload: [:settings])) do
      nil ->
        Logger.error("User not found in #{__MODULE__}")
        {:error, :not_found}

      user ->
        {:ok, user}
    end
  end
end

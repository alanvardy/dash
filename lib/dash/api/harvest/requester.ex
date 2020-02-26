defmodule Dash.Api.Harvest.Requester do
  @moduledoc "For pulling information from the Harvest api"
  use GenServer
  require Logger
  alias Dash.Accounts.User
  alias Dash.Api
  alias Dash.Api.Harvest.Server

  # Client

  @spec start_link(pid, User.t()) :: :ignore | {:error, any} | {:ok, pid}
  def start_link(parent_pid, user) do
    GenServer.start_link(__MODULE__, %{parent: parent_pid, user: user})
  end

  # Server

  # 60 Seconds
  @refresh_time 60_000

  @doc "Create GenServer, make sure user exists"
  def init(state) do
    Process.send_after(self(), :tick, 0)
    {:ok, state}
  end

  @doc "Tick refreshes data from the API"
  def handle_info(:tick, %{parent: parent, user: user} = state) do
    case Api.get_harvest(user) do
      {:ok, reports} ->
        Server.update(parent, reports)

      {:error, message} ->
        Logger.error("Harvest server error in #{__MODULE__}: #{inspect(message)}")
    end

    Process.send_after(self(), :tick, @refresh_time)
    {:noreply, state}
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
end

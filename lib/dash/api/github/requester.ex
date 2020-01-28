defmodule Dash.Api.Github.Requester do
  @moduledoc "For pulling information from the GitHub api"
  use GenServer
  require Logger
  alias Dash.Api

  # 30 Seconds
  @refresh_time 30_000

  @doc "Create GenServer, make sure user exists"
  def init(state) do
    Process.send_after(self(), :tick, 0)
    {:ok, state}
  end

  @doc "Tick refreshes data from the API"
  def handle_info(:tick, %{parent: parent, user: user} = state) do
    case Api.get_issues(user) do
      {:ok, issues} ->
        GenServer.cast(parent, {:update_issues, issues})

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

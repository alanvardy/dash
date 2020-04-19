defmodule Dash.Harvest.Server do
  @moduledoc "For handling and storing requests to the GitHub API"
  use GenServer
  alias Dash.Accounts.User
  alias Dash.Harvest.Requester
  alias Dash.{ProcessRegistry, Repo}
  import Ecto.Query
  require Logger

  # Client

  @spec start_link(pos_integer) :: :ignore | {:error, any} | {:ok, pid}
  def start_link(user_id) do
    find_or_create_server(user_id)
  end

  @spec update(atom | pid | {atom, any} | {:via, atom, any}, any) :: :ok
  def update(pid, reports) do
    GenServer.cast(pid, {:update_reports, reports})
  end

  @spec fetch(pos_integer) :: [map] | nil
  def fetch(user_id) do
    pid = find_or_create_server(user_id)
    GenServer.call(pid, :reports)
  end

  defp find_or_create_server(user_id) do
    server_name = "server-harvest-#{user_id}"

    case Registry.lookup(ProcessRegistry, server_name) do
      # Server does not exist for user
      [] ->
        name = {:via, Registry, {ProcessRegistry, server_name, :hello}}
        {:ok, pid} = GenServer.start_link(__MODULE__, %{user_id: user_id}, name: name)
        pid

      # Server does exist and its pid is returned
      server_list ->
        server_list |> List.first() |> elem(0)
    end
  end

  # Server

  @doc "Create GenServer, make sure user exists"
  def init(%{user_id: user_id}) do
    case get_user(user_id) do
      {:ok, user} ->
        Requester.start_link(self(), user)
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

  defp get_user(user_id) do
    case Repo.one(from(u in User, where: u.id == ^user_id, preload: [:settings])) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end

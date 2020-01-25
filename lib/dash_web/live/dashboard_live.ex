defmodule DashWeb.DashboardLive do
  @moduledoc "Live Dashboard for main page"
  use Phoenix.LiveView
  alias Dash.Api.Github.Server, as: GithubServer
  alias Dash.Api.Harvest.Server, as: HarvestServer

  def mount(:not_mounted_at_router, %{"user" => user}, socket) do
    if connected?(socket) do
      socket =
        socket
        |> assign(:user, user)
        |> start_github_server()
        |> start_harvest_server()
        |> get_harvest()
        |> get_issues()

      :timer.send_interval(1_000, self(), :update)
      {:ok, socket}
    else
      {:ok, socket}
    end
  end

  def handle_info(:update, socket) do
    :timer.send_interval(1_000, self(), :update)

    socket =
      socket
      |> get_issues()
      |> get_harvest

    {:noreply, socket}
  end

  def render(assigns) do
    DashWeb.PageView.render("dashboard_live.html", assigns)
  end

  # Start a server unless it has already been created
  defp start_harvest_server(%{assigns: %{harvest_server: _}} = socket) do
    socket
  end

  defp start_harvest_server(socket) do
    %{assigns: %{user: %{id: id}}} = socket
    {:ok, pid} = GenServer.start_link(HarvestServer, %{id: id})
    assign(socket, :harvest_server, pid)
  end

  defp start_github_server(%{assigns: %{github_server: _}} = socket) do
    socket
  end

  defp start_github_server(socket) do
    %{assigns: %{user: %{id: id}}} = socket
    {:ok, pid} = GenServer.start_link(GithubServer, %{id: id})
    assign(socket, :github_server, pid)
  end

  defp get_harvest(%{assigns: %{harvest_server: pid}} = socket) do
    harvest = GenServer.call(pid, :harvest)
    assign(socket, :harvest, harvest)
  end

  defp get_harvest(socket) do
    socket
  end

  defp get_issues(%{assigns: %{github_server: pid}} = socket) do
    issues = GenServer.call(pid, :issues)
    assign(socket, :issues, issues)
  end

  defp get_issues(socket) do
    socket
  end
end

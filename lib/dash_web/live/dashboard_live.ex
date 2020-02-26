defmodule DashWeb.DashboardLive do
  @moduledoc "Live Dashboard for main page"
  use Phoenix.LiveView
  alias Dash.Api.Github.Server, as: GithubServer
  alias Dash.Api.Harvest.Server, as: HarvestServer
  alias Phoenix.LiveView.Socket

  @spec mount(:not_mounted_at_router, map, Socket.t()) :: {:ok, Socket.t()}
  def mount(:not_mounted_at_router, %{"user_id" => user_id}, socket) do
    if connected?(socket) do
      socket =
        socket
        |> assign(:user_id, user_id)
        |> get_harvest()
        |> get_issues()

      :timer.send_interval(5_000, self(), :update)
      {:ok, socket}
    else
      {:ok, socket}
    end
  end

  @spec handle_info(:update, Socket.t()) :: {:noreply, Socket.t()}
  def handle_info(:update, socket) do
    socket =
      socket
      |> get_issues()
      |> get_harvest()

    {:noreply, socket}
  end

  def render(assigns) do
    DashWeb.PageView.render("dashboard_live.html", assigns)
  end

  defp get_harvest(%{assigns: %{user_id: user_id}} = socket) do
    harvest = HarvestServer.fetch(user_id)
    assign(socket, :harvest, harvest)
  end

  defp get_issues(%{assigns: %{user_id: user_id}} = socket) do
    issues = GithubServer.fetch(user_id)
    assign(socket, :issues, issues)
  end
end

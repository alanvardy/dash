defmodule DashWeb.DashboardLive do
  @moduledoc "Live Dashboard for main page"
  use Phoenix.LiveView
  alias Dash.Api

  def mount(%{user: user}, socket) do
    if connected?(socket), do: :timer.send_interval(60_000, self(), :update)
    harvest = Api.get_harvest(user)
    issues = Api.get_issues(user)

    {:ok, assign(socket, harvest: harvest, issues: issues, user: user)}
  end

  def handle_info(:update, socket) do
    :timer.send_interval(60_000, self(), :update)
    user = socket.assigns.user
    harvest = Api.get_harvest(user)
    issues = Api.get_issues(user)

    {:noreply, assign(socket, harvest: harvest, issues: issues)}
  end

  def render(assigns) do
    DashWeb.PageView.render("dashboard_live.html", assigns)
  end
end

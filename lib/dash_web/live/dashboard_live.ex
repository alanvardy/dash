defmodule DashWeb.DashboardLive do
  @moduledoc "Live Dashboard for main page"
  use Phoenix.LiveView
  alias Dash.Api

  def mount(%{user: user}, socket) do
    harvest = Api.get_harvest(user)
    issues = Api.get_issues(user)

    if connected?(socket), do: :timer.send_interval(600_000, self(), :update)

    {:ok, assign(socket, harvest: harvest, issues: issues, user: user)}
  end

  def handle_info(:update, socket) do
    user = socket.assigns.user
    harvest = Api.get_harvest(user)
    issues = Api.get_issues(user)

    :timer.send_interval(600_000, self(), :update)

    {:noreply, assign(socket, harvest: harvest, issues: issues)}
  end

  def render(assigns) do
    DashWeb.PageView.render("dashboard_live.html", assigns)
  end
end

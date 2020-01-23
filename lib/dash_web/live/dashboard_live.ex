defmodule DashWeb.DashboardLive do
  @moduledoc "Live Dashboard for main page"
  use Phoenix.LiveView
  alias Dash.Api

  def mount(:not_mounted_at_router, %{"user" => user}, socket) do
    if connected?(socket), do: :timer.send_interval(60_000, self(), :update)
    harvest = get_harvest(user)
    issues = Api.get_issues(user)

    {:ok, assign(socket, harvest: harvest, issues: issues, user: user)}
  end

  def handle_info(:update, socket) do
    :timer.send_interval(60_000, self(), :update)
    user = socket.assigns.user
    harvest = get_harvest(user)
    issues = Api.get_issues(user)

    {:noreply, assign(socket, harvest: harvest, issues: issues)}
  end

  def render(assigns) do
    DashWeb.PageView.render("dashboard_live.html", assigns)
  end

  defp get_harvest(user) do
    case Api.get_harvest(user) do
      {:ok, report} -> report
      {:error, _} -> []
    end
  end
end

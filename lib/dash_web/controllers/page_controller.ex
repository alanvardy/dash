defmodule DashWeb.PageController do
  use DashWeb, :controller

  alias Dash.Api

  def index(conn, _params) do
    user = conn.assigns.current_user
    reports = Api.interpret_reports(user)
    background = Api.get_background()
    render(conn, "index.html", reports: reports, background: background)
  end
end

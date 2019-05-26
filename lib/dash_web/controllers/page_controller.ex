defmodule DashWeb.PageController do
  use DashWeb, :controller

  alias DashWeb.Api

  def index(conn, _params) do
    user = conn.assigns.current_user
    reports = Api.interpret_reports(user)
    render(conn, "index.html", reports: reports)
  end
end

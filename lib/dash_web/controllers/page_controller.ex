defmodule DashWeb.PageController do
  use DashWeb, :controller

  alias DashWeb.Api

  def index(conn, _params) do
    reports = Api.interpret_reports()
    render(conn, "index.html", reports: reports)
  end
end

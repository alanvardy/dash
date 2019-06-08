defmodule DashWeb.PageController do
  use DashWeb, :controller

  alias Dash.{Api, Backgrounds}

  def index(conn, _params) do
    user = conn.assigns.current_user
    reports = Api.get_harvest(user)
    background = Backgrounds.get_for(user)
    render(conn, "index.html", reports: reports, background: background)
  end
end

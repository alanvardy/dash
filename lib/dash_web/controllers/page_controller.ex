defmodule DashWeb.PageController do
  use DashWeb, :controller

  alias Dash.{Api, Backgrounds}

  def index(conn, _params) do
    user = conn.assigns.current_user
    harvest = Api.get_harvest(user)
    background = Backgrounds.get_for(user)
    render(conn, "index.html", harvest: harvest, background: background)
  end
end

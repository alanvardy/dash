defmodule DashWeb.PageController do
  use DashWeb, :controller

  alias Dash.Api

  plug :authenticate when action in [:new]

  def index(conn, _params) do
    user = conn.assigns.current_user
    harvest = Api.get_harvest(user)
    background = Api.get_background(user)
    render(conn, "index.html", harvest: harvest, background: background)
  end

  def new(conn, _params) do
    user = conn.assigns.current_user
    Api.new_background(user)
    redirect(conn, to: "/")
  end

  defp authenticate(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in to access that page")
      |> redirect(to: Routes.session_path(conn, :new))
      |> halt()
    end
  end
end

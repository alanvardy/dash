defmodule DashWeb.FallbackController do
  use DashWeb, :controller

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:forbidden)
    |> put_view(DashWeb.ErrorView)
    |> render(:"403")
  end
end

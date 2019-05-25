defmodule DashWeb.SessionController do
  use DashWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"email" => email, "password" => pass}}) do
    case DashWeb.Auth.login_by_email_and_pass(conn, email, pass) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: Routes.page_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid email/password combination")
        |> render("new.html")
    end

  end
  def delete(conn, _) do
    conn
    |> DashWeb.Auth.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end
end

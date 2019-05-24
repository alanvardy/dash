defmodule DashWeb.SettingsController do
  use DashWeb, :controller

  alias Dash.Accounts
  alias Dash.Accounts.User
  alias Dash.Accounts.Settings
  alias DashWeb.Auth

  plug :authenticate when action in [:show, :edit, :update]

  def show(conn, %{"id" => user_id}) do
    IO.inspect(user_id, label: 12)
    settings = Accounts.get_settings!(user_id)
    render(conn, "show.html", settings: settings)
  end

  def edit(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    changeset = Accounts.change_user(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    case Accounts.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: Routes.user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
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

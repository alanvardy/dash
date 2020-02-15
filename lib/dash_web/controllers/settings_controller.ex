defmodule DashWeb.SettingsController do
  use DashWeb, :controller

  alias Dash.{Accounts, Api}
  alias Dash.Accounts.Policy

  plug :authenticate when action in [:edit, :update]

  @spec edit(Plug.Conn.t(), map) :: Plug.Conn.t()
  def edit(conn, %{"id" => id}) do
    settings = Accounts.get_settings!(id)
    user = Accounts.get_current_user(conn)

    with :ok <- permit(Policy, :edit, settings, user) do
      changeset = Accounts.change_settings(settings)
      background = Api.get_background(user)
      render(conn, "edit.html", settings: settings, changeset: changeset, background: background)
    end
  end

  @spec update(Plug.Conn.t(), map) :: Plug.Conn.t()
  def update(conn, %{"id" => id, "settings" => settings_params}) do
    user = Accounts.get_current_user(conn)
    settings = Accounts.get_settings!(id)

    with :ok <- permit(Policy, :update, settings, user) do
      case Accounts.update_settings(settings, settings_params) do
        {:ok, settings} ->
          conn
          |> put_flash(:info, "Settings updated successfully.")
          |> redirect(to: Routes.settings_path(conn, :edit, settings))

        {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "edit.html", settings: settings, changeset: changeset)
      end
    end
  end

  defp authenticate(conn, _opts) do
    if Accounts.get_current_user(conn) do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in to access that page")
      |> redirect(to: Routes.session_path(conn, :new))
      |> halt()
    end
  end
end

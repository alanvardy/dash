defmodule DashWeb.SettingsController do
  use DashWeb, :controller

  alias Dash.Accounts
  alias Dash.Accounts.Settings

  plug :authenticate when action in [:edit, :update]
  plug :load_and_authorize_resource, model: Settings, only: [:edit, :update]

  def edit(conn, %{"id" => id}) do
    settings = Accounts.get_settings!(id)
    changeset = Accounts.change_settings(settings)
    render(conn, "edit.html", settings: settings, changeset: changeset)
  end

  def update(conn, %{"id" => id, "settings" => settings_params}) do
    settings = Accounts.get_settings!(id)

    case Accounts.update_settings(settings, settings_params) do
      {:ok, settings} ->
        conn
        |> put_flash(:info, "Settings updated successfully.")
        |> redirect(to: Routes.settings_path(conn, :edit, settings))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", settings: settings, changeset: changeset)
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

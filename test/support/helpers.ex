defmodule Dash.Helpers do
  @moduledoc "Test helpers"
  use Phoenix.ConnTest
  alias DashWeb.Router.Helpers, as: Routes
  @endpoint DashWeb.Endpoint

  def log_in_(conn, user) do
    post(conn, Routes.session_path(conn, :create),
      session: %{email: user.email, password: user.password}
    )
  end

  def log_out(conn) do
    delete(conn, Routes.session_path(conn, :delete, conn.assigns.current_user))
  end

  def strip_all(users) do
    case users do
      [_ | _] ->
        users
        |> Enum.map(fn x -> strip_passwords(x) end)
        |> Enum.map(fn x -> strip_settings(x) end)

      _ ->
        users
        |> strip_passwords()
        |> strip_settings()
    end
  end

  def strip_passwords(users) do
    users
    |> Map.put(:password, nil)
    |> Map.put(:password_confirmation, nil)
  end

  def strip_settings(users) do
    case users do
      [_ | _] -> Enum.map(users, fn x -> Map.put(x, :settings, nil) end)
      _ -> Map.put(users, :settings, nil)
    end
  end

  def strip_user(settings) do
    Map.put(settings, :user, nil)
  end
end

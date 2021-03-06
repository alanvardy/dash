defmodule DashWeb.PageController do
  use DashWeb, :controller

  alias Dash.{Accounts, Backgrounds}
  alias Dash.Accounts.{Policy, User}

  plug :authenticate when action in [:new]

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    user = Accounts.get_current_user(conn)

    cond do
      is_nil(user) ->
        render(conn, "index.html")

      has_settings(user) ->
        background = Backgrounds.get(user)
        render(conn, "index.html", background: background)

      true ->
        conn
        |> put_flash(:info, "This app won't do much without setting up your API keys")
        |> redirect(to: Routes.settings_path(conn, :edit, user.settings))
    end
  end

  @spec new(Plug.Conn.t(), any) :: Plug.Conn.t()
  def new(conn, _params) do
    user = Accounts.get_current_user(conn)

    with :ok <- permit(Policy, :new, :background, user) do
      Backgrounds.new(user)
      redirect(conn, to: "/")
    end
  end

  # Check if there is a logged in user
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

  defp has_settings(%User{settings: %{harvest_api_key: key}})
       when key not in ["", nil],
       do: true

  defp has_settings(%User{settings: %{github_username: name}})
       when name not in ["", nil],
       do: true

  defp has_settings(_), do: false
end

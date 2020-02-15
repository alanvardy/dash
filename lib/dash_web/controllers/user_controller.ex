defmodule DashWeb.UserController do
  use DashWeb, :controller

  alias Dash.{Accounts, Api}
  alias Dash.Accounts.{Policy, User}
  alias DashWeb.Auth

  plug :authenticate when action in [:index, :edit, :update, :delete]

  @spec new(Plug.Conn.t(), any) :: Plug.Conn.t()
  def new(conn, _params) do
    user = Accounts.get_current_user(conn)

    with :ok <- permit(Policy, :new, %User{}, user) do
      changeset = Accounts.change_user(%User{})
      render(conn, "new.html", changeset: changeset)
    end
  end

  @spec create(Plug.Conn.t(), map) :: Plug.Conn.t()
  def create(conn, %{"user" => user_params}) do
    user = Accounts.get_current_user(conn)

    with :ok <- permit(Policy, :create, %User{}, user) do
      case Accounts.create_user(user_params) do
        {:ok, %{user: user}} ->
          conn
          |> Auth.login(user)
          |> put_flash(:info, "User created successfully.")
          |> redirect(to: Routes.user_path(conn, :edit, user))

        {:error, :user, %Ecto.Changeset{} = changeset, %{}} ->
          render(conn, "new.html", changeset: changeset)
      end
    end
  end

  @spec edit(Plug.Conn.t(), map) :: Plug.Conn.t()
  def edit(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    current_user = Accounts.get_current_user(conn)

    with :ok <- permit(Policy, :edit, user, current_user) do
      background = Api.get_background(current_user)
      changeset = Accounts.change_user(user)
      render(conn, "edit.html", user: user, changeset: changeset, background: background)
    end
  end

  @spec update(Plug.Conn.t(), map) :: Plug.Conn.t()
  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)
    current_user = Accounts.get_current_user(conn)

    with :ok <- permit(Policy, :update, user, current_user) do
      case Accounts.update_user(user, user_params) do
        {:ok, user} ->
          conn
          |> put_flash(:info, "User updated successfully.")
          |> redirect(to: Routes.user_path(conn, :edit, user))

        {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "edit.html", user: user, changeset: changeset)
      end
    end
  end

  def delete(conn, %{"id" => id}) do
    current_user = Accounts.get_current_user(conn)
    user = Accounts.get_user!(id)

    with :ok <- permit(Policy, :delete, user, current_user) do
      {:ok, _user} = Accounts.delete_user(user)

      conn
      |> put_flash(:info, "Account deleted successfully.")
      |> redirect(to: Routes.page_path(conn, :index))
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

  def handle_unauthorized(conn) do
    conn
    |> put_flash(:warning, "You are not authorized to access this page")
    |> redirect(to: Routes.page_path(conn, :index))
    |> halt()
  end
end

defmodule DashWeb.UserController do
  use DashWeb, :controller

  alias Dash.Accounts
  alias Dash.Accounts.User
  alias DashWeb.Auth

  plug :authenticate when action in [:index, :show, :edit, :update, :delete]
  plug :load_and_authorize_resource, model: User, preload: :settings, except: [:new, :create]

  # def index(conn, _params) do
  #   users = Accounts.list_users()
  #   render(conn, "index.html", users: users)
  # end

  def new(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, %{user: user}} ->
        conn
        |> Auth.login(user)
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: Routes.user_path(conn, :show, user))

      {:error, :user, %Ecto.Changeset{} = changeset, %{}} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.html", user: user)
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

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    {:ok, _user} = Accounts.delete_user(user)

    conn
    |> put_flash(:info, "Account deleted successfully.")
    |> redirect(to: Routes.page_path(conn, :index))
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

defmodule DashWeb.UserControllerTest do
  @moduledoc false
  import Dash.Factory
  alias Dash.Accounts
  use DashWeb.ConnCase, async: true

  @update_attrs %{
    email: "some updated email",
    name: "some updated name",
    password: "some updated password_hash",
    password_confirmation: "some updated password_hash"
  }
  @invalid_attrs %{email: nil, name: nil, password: nil, password_confirmation: nil}

  describe "index" do
    test "doesnt list all users when not logged in", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :index))
      assert redirected_to(conn) == Routes.session_path(conn, :new)
    end

    test "doesnt list all users when logged in", %{conn: conn} do
      user = insert(:user)
      conn = log_in_(conn, user)
      conn = get(conn, Routes.user_path(conn, :index))
      assert redirected_to(conn) == Routes.page_path(conn, :index)
    end
  end

  describe "show user" do
    test "redirects from showing chosen user when not logged in", %{conn: conn} do
      user = insert(:user)
      conn = get(conn, Routes.user_path(conn, :show, user))
      assert redirected_to(conn) == Routes.session_path(conn, :new)
    end

    test "redirects when different user", %{conn: conn} do
      user = insert(:user)
      user2 = insert(:user2)
      conn = log_in_(conn, user2)
      conn = get(conn, Routes.user_path(conn, :show, user))
      assert redirected_to(conn) == Routes.page_path(conn, :index)
    end

    test "shows user when user", %{conn: conn} do
      user = insert(:user)
      conn = log_in_(conn, user)
      conn = get(conn, Routes.user_path(conn, :show, user))
      assert html_response(conn, 200) =~ "Show User"
    end
  end

  describe "new user" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :new))
      assert html_response(conn, 200) =~ "Sign Up"
    end
  end

  describe "create user" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @update_attrs)
      assert redirected_to(conn) == Routes.user_path(conn, :show, conn.assigns.current_user)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @invalid_attrs)
      assert html_response(conn, 200) =~ "Sign up"
    end
  end

  describe "edit user" do
    test "redirects from editing chosen user when not logged in", %{conn: conn} do
      user = insert(:user)
      conn = get(conn, Routes.user_path(conn, :edit, user))
      assert redirected_to(conn) == Routes.session_path(conn, :new)
    end

    test "redirects when different user", %{conn: conn} do
      user = insert(:user)
      user2 = insert(:user2)
      conn = log_in_(conn, user2)
      conn = get(conn, Routes.user_path(conn, :edit, user))
      assert redirected_to(conn) == Routes.page_path(conn, :index)
    end

    test "renders form for editing chosen user when user", %{conn: conn} do
      user = insert(:user)
      conn = log_in_(conn, user)
      conn = get(conn, Routes.user_path(conn, :edit, user))
      assert html_response(conn, 200) =~ "Edit User"
    end
  end

  describe "update user" do
    test "redirects when user not logged in", %{conn: conn} do
      user = insert(:user)
      conn = put(conn, Routes.user_path(conn, :update, user), user: @update_attrs)
      assert redirected_to(conn) == Routes.session_path(conn, :new)
    end

    test "redirects when different user", %{conn: conn} do
      user = insert(:user)
      user2 = insert(:user2)
      conn = log_in_(conn, user2)
      conn = put(conn, Routes.user_path(conn, :update, user), user: @update_attrs)
      assert redirected_to(conn) == Routes.page_path(conn, :index)
    end

    test "updates user when user", %{conn: conn} do
      user = insert(:user)
      conn = log_in_(conn, user)
      conn = put(conn, Routes.user_path(conn, :update, user), user: @update_attrs)
      assert redirected_to(conn) == Routes.user_path(conn, :show, user)
      user = Accounts.get_user!(user.id)
      assert user.name == @update_attrs.name
      assert user.email == @update_attrs.email
    end
  end

  describe "delete user" do
    test "doesn't delete chosen user when not logged in", %{conn: conn} do
      user = insert(:user)
      conn = delete(conn, Routes.user_path(conn, :delete, user))
      assert redirected_to(conn) == Routes.session_path(conn, :new)
    end

    test "doesn't delete chosen user when logged in", %{conn: conn} do
      user = insert(:user)
      user2 = insert(:user2)
      conn = log_in_(conn, user2)
      conn = delete(conn, Routes.user_path(conn, :delete, user))
      assert redirected_to(conn) == Routes.page_path(conn, :index)
      assert strip_settings(Accounts.list_users()) == [strip_all(user), strip_all(user2)]
    end
  end

  def log_in_(conn, user) do
    post(conn, Routes.session_path(conn, :create),
      session: %{email: user.email, password: user.password}
    )
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
end

defmodule DashWeb.UserControllerTest do
  use DashWeb.ConnCase

  import Plug.Test

  alias Dash.Accounts

  @create_attrs %{email: "some email", name: "some name", password: "password", password_confirmation: "password"}
  @create_attrs2 %{email: "some email2", name: "some name", password: "password", password_confirmation: "password"}
  @update_attrs %{email: "some updated email", name: "some updated name", password: "some updated password_hash", password_confirmation: "some updated password_hash"}
  @invalid_attrs %{email: nil, name: nil, password: nil, password_confirmation: nil}

  def fixture(:user) do
    {:ok, user} = Accounts.create_user(@create_attrs)
    user
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :index))
      # assert html_response(conn, 200) =~ "Listing Users"
      assert redirected_to(conn) == Routes.session_path(conn, :new)
    end
  end

  describe "new user" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :new))
      assert html_response(conn, 200) =~ "Sign Up"
    end
  end

  describe "create user" do
    setup [:create_user]

    test "redirects to show when data is valid", %{conn: conn, user: user} do
      conn = conn
      |> init_test_session(user_id: user.id)

      %Plug.Conn{assigns: %{current_user: user2}} = post(conn, Routes.user_path(conn, :create), user: @create_attrs2)

      conn = get(conn, Routes.user_path(conn, :show, user2))
      assert html_response(conn, 200) =~ "Show User"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @invalid_attrs)
      assert html_response(conn, 200) =~ "Sign up"
    end
  end

  describe "edit user" do
    setup [:create_user]

    test "renders form for editing chosen user", %{conn: conn, user: user} do
      conn = get(conn, Routes.user_path(conn, :edit, user))
      assert html_response(conn, 200) =~ "Edit User"
    end
  end

  describe "update user" do
    setup [:create_user]

    test "redirects when data is valid but user not logged in", %{conn: conn, user: user} do
      conn = put(conn, Routes.user_path(conn, :update, user), user: @update_attrs)
      assert redirected_to(conn) == Routes.session_path(conn, :new)
    end

    # test "redirects when data is valid", %{conn: conn, user: user} do
    #   conn = put(conn, Routes.user_path(conn, :update, user), user: @update_attrs)
    #   assert redirected_to(conn) == Routes.user_path(conn, :show, user)

    #   conn = get(conn, Routes.user_path(conn, :show, user))
    #   assert html_response(conn, 200) =~ "some updated email"
    # end

    # test "renders errors when data is invalid", %{conn: conn, user: user} do
    #   conn = put(conn, Routes.user_path(conn, :update, user), user: @invalid_attrs)
    #   assert html_response(conn, 200) =~ "Edit User"
    # end
  end

  describe "delete user" do
    setup [:create_user]

    test "doesn't delete chosen user when not logged in", %{conn: conn, user: user} do
      conn = delete(conn, Routes.user_path(conn, :delete, user))
      assert redirected_to(conn) == Routes.session_path(conn, :new)
    end
    # test "deletes chosen user", %{conn: conn, user: user} do
    #   conn = delete(conn, Routes.user_path(conn, :delete, user))
    #   assert redirected_to(conn) == Routes.user_path(conn, :index)
    #   assert_error_sent 404, fn ->
    #     get(conn, Routes.user_path(conn, :show, user))
    #   end
    # end
  end

  defp create_user(_) do
    user = fixture(:user)
    {:ok, user: user}
  end
end

defmodule DashWeb.UserControllerTest do
  @moduledoc false
  import Dash.Factory
  use DashWeb.ConnCase, async: true

  @update_attrs %{email: "some updated email", name: "some updated name", password: "some updated password_hash", password_confirmation: "some updated password_hash"}
  @invalid_attrs %{email: nil, name: nil, password: nil, password_confirmation: nil}

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
  #   test "redirects to show when data is valid", %{conn: conn} do
      # conn = conn
      # |> init_test_session(user_id: user.id)

      # %{user: user} = post(conn, Routes.user_path(conn, :create, user: @create_attrs2))

      # conn = get(conn, Routes.user_path(conn, :show, user2))
      # assert html_response(conn, 200) =~ "Show User"
    # end

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
    test "redirects from editing chosen user when different user", %{conn: conn} do
      user = insert(:user_with_pw)
      user2 = insert(:user2_with_pw)
      conn = log_in_(conn, user2)
      conn = get(conn, Routes.user_path(conn, :edit, user))
      assert redirected_to(conn) == Routes.session_path(conn, :new)
    end
    test "renders form for editing chosen user when user", %{conn: conn} do
      user = insert(:user_with_pw)
      conn = log_in_(conn, user)
      conn = get(conn, Routes.user_path(conn, :edit, user))
      assert html_response(conn, 200) =~ "Edit User"
    end
  end

  describe "update user" do
    test "redirects when data is valid but user not logged in", %{conn: conn} do
      user = insert(:user)
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
    test "doesn't delete chosen user when not logged in", %{conn: conn} do
      user = insert(:user)
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

  defp log_in_(conn, user) do
    post(conn, Routes.session_path(conn, :create), session: %{email: user.email, password: user.password})
  end
end

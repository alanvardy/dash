defmodule DashWeb.UserControllerTest do
  @moduledoc false
  alias Dash.Accounts
  import Dash.Factory
  import Dash.Helpers
  use DashWeb.ConnCase, async: true

  @update_attrs %{
    email: "some updated email",
    name: "some updated name",
    password: "some updated password_hash",
    password_confirmation: "some updated password_hash"
  }

  @invalid_attrs %{email: nil, name: nil, password: nil, password_confirmation: nil}

  ##### INDEX ACTIONS #####

  # describe "index" do
  #   test "doesnt list all users when not logged in", %{conn: conn} do
  #     conn = get(conn, Routes.user_path(conn, :index))
  #     assert redirected_to(conn) == Routes.session_path(conn, :new)
  #   end

  #   test "doesnt list all users when logged in", %{conn: conn} do
  #     user = insert(:user)
  #     conn = log_in_(conn, user)
  #     conn = get(conn, Routes.user_path(conn, :index))
  #     assert redirected_to(conn) == Routes.page_path(conn, :index)
  #   end
  # end

  ##### NEW ACTIONS #####

  describe "new user" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :new))
      assert html_response(conn, 200) =~ "Sign Up"
    end
  end

  ##### CREATE ACTIONS #####

  describe "create user" do
    test "redirects to edit when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @update_attrs)
      assert redirected_to(conn) == Routes.user_path(conn, :edit, conn.assigns.current_user)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @invalid_attrs)
      assert html_response(conn, 200) =~ "Sign up"
    end
  end

  ##### EDIT ACTIONS #####

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
      assert html_response(conn, 200) =~ "User Settings"
    end
  end

  ##### UPDATE ACTIONS #####

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
      assert redirected_to(conn) == Routes.user_path(conn, :edit, user)
      user = Accounts.get_user!(user.id)
      assert user.name == @update_attrs.name
      assert user.email == @update_attrs.email
    end

    test "returns a changeset when given bad attributes", %{conn: conn} do
      user = insert(:user)
      conn = log_in_(conn, user)
      put(conn, Routes.user_path(conn, :update, user), user: @invalid_attrs)
      user = Accounts.get_user!(user.id)
      refute user.name == @update_attrs.name
    end
  end

  ##### DELETE ACTIONS #####

  describe "delete user" do
    test "doesn't delete chosen user when not logged in", %{conn: conn} do
      user = insert(:user)
      conn = delete(conn, Routes.user_path(conn, :delete, user))
      assert redirected_to(conn) == Routes.session_path(conn, :new)
    end

    test "doesn't delete chosen user when logged in as different user", %{conn: conn} do
      user = insert(:user)
      user2 = insert(:user2)
      conn = log_in_(conn, user2)
      conn = delete(conn, Routes.user_path(conn, :delete, user))
      assert redirected_to(conn) == Routes.page_path(conn, :index)

      inserted =
        [user, user2]
        |> Enum.map(&strip_all/1)

      in_database =
        Accounts.list_users()
        |> Enum.map(&strip_all/1)

      assert inserted == in_database
    end

    test "can delete user when logged in as same user", %{conn: conn} do
      user = insert(:user)
      conn = log_in_(conn, user)
      assert strip_settings(Accounts.list_users()) == [strip_all(user)]
      conn = delete(conn, Routes.user_path(conn, :delete, user))
      assert redirected_to(conn) == Routes.page_path(conn, :index)
      assert Accounts.list_users() == []
    end
  end
end

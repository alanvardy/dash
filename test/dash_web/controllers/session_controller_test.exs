defmodule DashWeb.SessionControllerTest do
  @moduledoc false
  import Dash.Factory
  use DashWeb.ConnCase, async: true

  ##### LOGIN/OUT ACTIONS #####

  describe "login" do
    test "can get login page", %{conn: conn} do
      conn = get(conn, Routes.session_path(conn, :new))
      assert html_response(conn, 200) =~ "Log in"
    end

    test "User cannot log in with valid username and bad password", %{conn: conn} do
      user = insert(:user)

      conn =
        post(conn, Routes.session_path(conn, :create),
          session: %{email: user.email, password: "badpassword"}
        )

      assert conn.assigns.current_user == nil
    end

    test "User cannot log in with bad username and bad password", %{conn: conn} do
      insert(:user)

      conn =
        post(conn, Routes.session_path(conn, :create),
          session: %{email: "badusername", password: "badpassword"}
        )

      assert conn.assigns.current_user == nil
    end

    test "User can log in and log out", %{conn: conn} do
      user = insert(:user)

      conn =
        post(conn, Routes.session_path(conn, :create),
          session: %{email: user.email, password: user.password}
        )

      assert redirected_to(conn) == Routes.page_path(conn, :index)
      assert conn.assigns.current_user.id == user.id

      conn = delete(conn, Routes.session_path(conn, :delete, user))

      assert redirected_to(conn) == Routes.page_path(conn, :index)
      assert conn.assigns.current_user == nil
    end
  end
end

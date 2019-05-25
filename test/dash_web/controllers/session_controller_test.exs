defmodule DashWeb.SessionControllerTest do
  @moduledoc false
  import Dash.Factory
  use DashWeb.ConnCase, async: true

  describe "login" do
    test "User can log in with valid username and password", %{conn: conn} do
      user = insert(:user_with_pw)
      conn = post(conn, Routes.session_path(conn, :create), session: %{email: user.email, password: user.password})
      assert redirected_to(conn) == Routes.page_path(conn, :index)
      assert conn.assigns.current_user.id == user.id
    end

    test "User cannot log in with valid username and bad password", %{conn: conn} do
      user = insert(:user_with_pw)
      conn = post(conn, Routes.session_path(conn, :create), session: %{email: user.email, password: "badpassword"})
      assert conn.assigns.current_user == nil
    end
  end
end

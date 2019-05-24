defmodule DashWeb.SessionControllerTest do
  use DashWeb.ConnCase, async: true

  import Plug.Test
  alias Dash.Accounts

  @create_attrs %{email: "some email", name: "some name", password: "password", password_confirmation: "password"}

  def fixture(:user) do
    {:ok, user} = Accounts.create_user(@create_attrs)
    user
  end

  describe "login" do
    test "User can log in with valid username and password", %{conn: conn} do
      user = fixture(:user)
      conn = post(conn, Routes.session_path(conn, :create), session: %{email: user.email, password: user.password})
      assert redirected_to(conn) == Routes.page_path(conn, :index)
      assert conn.assigns.current_user.id == user.id
    end

    test "User can log in with valid username and bad password", %{conn: conn} do
      user = fixture(:user)
      conn = post(conn, Routes.session_path(conn, :create), session: %{email: user.email, password: "badpassword"})
      assert conn.assigns.current_user == nil
    end
  end
end

defmodule DashWeb.PageControllerTest do
  @moduledoc false
  import Dash.Factory
  import Dash.Helpers
  use DashWeb.ConnCase, async: true

  describe "Index" do
    test "is accessible without logging in", %{conn: conn} do
      conn = get(conn, "/")
      assert html_response(conn, 200) =~ "Welcome to Dash"
    end

    test "is accessible after logging in", %{conn: conn} do
      user = insert(:user)
      conn = log_in_(conn, user)
      conn = get(conn, "/")
      assert html_response(conn, 200) =~ "Dash"
    end
  end
end

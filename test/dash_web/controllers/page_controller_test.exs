defmodule DashWeb.PageControllerTest do
  use DashWeb.ConnCase, async: true

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Dash"
  end
end

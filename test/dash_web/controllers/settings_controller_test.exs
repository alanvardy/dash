defmodule DashWeb.SettingsControllerTest do
  @moduledoc false
  import Dash.Factory
  use DashWeb.ConnCase, async: true

  describe "settings" do
    ##### SHOW ACTIONS #####

    test "cannot show settings if not logged in", %{conn: conn} do
      user = insert(:user)
      settings = user.settings

      conn = get(conn, Routes.settings_path(conn, :show, settings))
      assert redirected_to(conn) == Routes.session_path(conn, :new)
    end

    test "cannot show settings if for a different user", %{conn: conn} do
      user = insert(:user)
      user2 = insert(:user2)
      settings = user.settings

      log_in_(conn, user2)
      conn = get(conn, Routes.settings_path(conn, :show, settings))
      assert redirected_to(conn) == Routes.session_path(conn, :new)
    end

    test "will show settings if for same user", %{conn: conn} do
      user = insert(:user)
      settings = insert(:settings, user: user)

      conn = log_in_(conn, user)
      conn = get(conn, Routes.settings_path(conn, :show, settings))
      assert html_response(conn, 200) =~ "Settings"
    end

    ##### EDIT ACTIONS #####

    test "cannot edit settings if not logged in", %{conn: conn} do
      user = insert(:user)
      settings = user.settings

      conn = get(conn, Routes.settings_path(conn, :edit, settings))
      assert redirected_to(conn) == Routes.session_path(conn, :new)
    end

    test "cannot edit settings if for a different user", %{conn: conn} do
      user = insert(:user)
      user2 = insert(:user2)
      settings = user.settings

      log_in_(conn, user2)
      conn = get(conn, Routes.settings_path(conn, :edit, settings))
      assert redirected_to(conn) == Routes.session_path(conn, :new)
    end

    test "will edit settings if for same user", %{conn: conn} do
      user = insert(:user)
      settings = insert(:settings, user: user)

      conn = log_in_(conn, user)
      conn = get(conn, Routes.settings_path(conn, :edit, settings))
      assert html_response(conn, 200) =~ "Settings"
    end

    #### UPDATE ACTIONS #####

    test "cannot update settings if not logged in", %{conn: conn} do
      settings = insert(:settings)
      new_attribute = "9999"

      conn =
        patch(conn, Routes.settings_path(conn, :update, settings),
          settings: %{harvest_account_id: new_attribute}
        )

      assert redirected_to(conn) == Routes.session_path(conn, :new)
    end

    test "cannot update settings if logged in as different user", %{conn: conn} do
      settings = insert(:settings)
      user2 = insert(:user2)
      new_attribute = "9999"

      conn = log_in_(conn, user2)

      conn =
        patch(conn, Routes.settings_path(conn, :update, settings),
          settings: %{harvest_account_id: new_attribute}
        )

      assert redirected_to(conn) == Routes.page_path(conn, :index)
    end

    test "can update settings if logged in same user", %{conn: conn} do
      user = insert(:user)
      settings = insert(:settings, user: user)
      new_attribute = "9999"

      conn = log_in_(conn, user)

      conn =
        patch(conn, Routes.settings_path(conn, :update, settings),
          settings: %{harvest_account_id: new_attribute}
        )

      assert redirected_to(conn) == Routes.settings_path(conn, :show, settings)
    end
  end

  ##### HELPERS #####

  defp log_in_(conn, user) do
    DashWeb.UserControllerTest.log_in_(conn, user)
  end
end

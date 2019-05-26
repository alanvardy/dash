defmodule DashWeb.SettingsControllerTest do
  @moduledoc false
  import Dash.Factory
  use DashWeb.ConnCase, async: true

  describe "settings" do
    # Show actions

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

    # Edit actions

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

    # update actions

    # test "cannot update settings if not logged in", %{conn: conn} do
    #   user = insert(:user)
    #   settings = user.settings
    #   new_attribute = "XXXXXX"

    #   conn =
    #     post(conn, Routes.settings_path(conn, :update, settings),
    #       settings: %{harvest_account_id: new_attribute}
    #     )

    #   assert redirected_to(conn) == Routes.session_path(conn, :new)
    #   new_settings = Accounts.get_settings(settings)
    #   refute new_settings.harvest_account_id == settings.harvest_account_id
    # end

    # test "cannot update settings if for a different user", %{conn: conn} do
    #   user = insert(:user)
    #   user2 = insert(:user2)
    #   settings = user.settings
    #   new_attribute = "XXXXXX"

    #   log_in_(conn, user2)

    #   conn =
    #     post(conn, Routes.settings_path(conn, :update, settings),
    #       settings: %{harvest_account_id: new_attribute}
    #     )

    #   assert redirected_to(conn) == Routes.session_path(conn, :new)
    #   new_settings = Accounts.get_settings(settings)
    #   refute new_settings.harvest_account_id == settings.harvest_account_id
    # end

    # test "will update settings if for same user", %{conn: conn} do
    #   user = insert(:user)
    #   settings = insert(:settings, user: user)
    #   new_attribute = "XXXXXX"

    #   conn = log_in_(conn, user)

    #   conn =
    #     post(conn, Routes.settings_path(conn, :update, settings),
    #       settings: %{harvest_account_id: new_attribute}
    #     )

    #   assert html_response(conn, 200) =~ "Settings"
    #   new_settings = Accounts.get_settings(settings)
    #   refute new_settings.harvest_account_id == settings.harvest_account_id
    # end
  end

  def log_in_(conn, user) do
    DashWeb.UserControllerTest.log_in_(conn, user)
  end
end

defmodule DashWeb.SettingsControllerTest do
  @moduledoc false
  alias Dash.Accounts
  import Dash.Factory
  import Dash.Helpers
  use DashWeb.ConnCase, async: true

  describe "settings" do
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

      conn = log_in_(conn, user2)
      conn = get(conn, Routes.settings_path(conn, :edit, settings))
      assert redirected_to(conn) == Routes.page_path(conn, :index)
    end

    test "will edit settings if for same user", %{conn: conn} do
      user = insert(:user)
      settings = insert(:settings, user: user)

      conn = log_in_(conn, user)
      conn = get(conn, Routes.settings_path(conn, :edit, settings))
      assert html_response(conn, 200) =~ "Harvest Credentials"
    end

    #### UPDATE ACTIONS #####

    test "cannot update settings if not logged in", %{conn: conn} do
      settings = insert(:settings)
      new_attribute = 2343
      new_attribute2 = "lkerjakjEEKJjbkjbkj"

      conn =
        patch(conn, Routes.settings_path(conn, :update, settings),
          settings: %{harvest_account_id: new_attribute, harvest_api_key: new_attribute2}
        )

      assert redirected_to(conn) == Routes.session_path(conn, :new)
      refute settings.harvest_account_id == new_attribute
      refute settings.harvest_api_key == new_attribute2
    end

    test "cannot update settings if logged in as different user", %{conn: conn} do
      settings = insert(:settings)
      user2 = insert(:user2)
      new_attribute = 2343
      new_attribute2 = "lkerjakjEEKJjbkjbkj"

      conn = log_in_(conn, user2)

      conn =
        patch(conn, Routes.settings_path(conn, :update, settings),
          settings: %{harvest_account_id: new_attribute, harvest_api_key: new_attribute2}
        )

      assert redirected_to(conn) == Routes.page_path(conn, :index)
      settings = Accounts.get_settings!(settings.id)
      refute settings.harvest_account_id == new_attribute
      refute settings.harvest_api_key == new_attribute2
    end

    test "can update settings if logged in same user", %{conn: conn} do
      user = insert(:user)
      settings = insert(:settings, user: user)
      new_attribute = 2343
      new_attribute2 = "lkerjakjEEKJjbkjbkj"

      conn = log_in_(conn, user)

      conn =
        patch(conn, Routes.settings_path(conn, :update, settings),
          settings: %{harvest_account_id: new_attribute, harvest_api_key: new_attribute2}
        )

      assert redirected_to(conn) == Routes.settings_path(conn, :edit, settings)
      settings = Accounts.get_settings!(settings.id)
      assert settings.harvest_account_id == new_attribute
      assert settings.harvest_api_key == new_attribute2
    end

    test "cannot update settings if only adding one of the keys", %{conn: conn} do
      user = insert(:user)
      settings = insert(:settings, user: user)
      new_attribute = nil

      conn = log_in_(conn, user)

      patch(conn, Routes.settings_path(conn, :update, settings),
        settings: %{harvest_account_id: new_attribute}
      )

      settings = Accounts.get_settings!(settings.id)
      refute settings.harvest_account_id == new_attribute

      patch(conn, Routes.settings_path(conn, :update, settings),
        settings: %{harvest_api_key: new_attribute}
      )

      settings = Accounts.get_settings!(settings.id)
      refute settings.harvest_api_key == new_attribute
    end
  end
end

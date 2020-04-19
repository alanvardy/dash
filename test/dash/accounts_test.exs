defmodule Dash.AccountsTest do
  @moduledoc false
  alias Dash.Accounts
  alias Dash.Accounts.Settings
  alias Dash.Accounts.User
  import DashWeb.Helpers
  import Dash.Factory
  use Dash.DataCase, async: true

  describe "users" do
    @valid_attrs %{
      email: "some email",
      name: "some name",
      password: "some password",
      password_confirmation: "some password"
    }
    @update_attrs %{
      email: "some updated email",
      name: "some updated name",
      password: "some updated password",
      password_confirmation: "some updated password"
    }
    @invalid_attrs %{email: nil, name: nil, password: nil, password_confirmation: nil}

    test "list_users/0 returns all users" do
      user = insert(:user)
      users = Accounts.list_users()

      assert strip_settings(users) == [strip_all(user)]
    end

    test "get_user!/1 returns the user with given id" do
      user = insert(:user)
      assert Accounts.get_user!(user.id) == strip_passwords(user)
    end

    test "create_user/1 with valid data creates a user" do
      {:ok, %{user: user, settings: _settings}} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, :user, %Ecto.Changeset{}, %{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = insert(:user)
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = insert(:user)
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert strip_all(user) == strip_settings(Accounts.get_user!(user.id))
    end

    test "delete_user/1 deletes the user" do
      user = insert(:user)
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "get_settings_by_user/1 gets the users settings" do
      user = insert(:user)
      settings = Accounts.get_settings_by_user(user)
      assert settings.user_id == user.id
    end

    test "get_settings!/1 gets settings" do
      settings = insert(:settings)
      settings2 = Accounts.get_settings!(settings.id)
      assert strip_user(settings) == settings2
      assert %Settings{} = settings
    end

    test "update_settings/1 updates settings" do
      new_attribute = "XXXXX"
      user = insert(:user)
      settings = user.settings
      Accounts.update_settings(settings, %{harvest_api_key: new_attribute})
      settings = Accounts.get_settings!(settings.id)
      assert %Settings{} = settings
      assert settings.harvest_api_key == new_attribute
    end

    test "change_user/1 returns a user changeset" do
      user = insert(:user)
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end

    test "change_settings/1 returns a settings changeset" do
      settings = insert(:settings)
      assert %Ecto.Changeset{} = Accounts.change_settings(settings)
    end
  end
end

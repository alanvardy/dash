defmodule Dash.Factory do
  @moduledoc "Factory for test entries"
  alias Dash.Accounts.Settings
  alias Dash.Accounts.User
  use ExMachina.Ecto, repo: Dash.Repo

  @spec user_factory() :: Dash.Accounts.User.t()
  def user_factory do
    %User{
      name: "User",
      email: "email@place.com",
      password_hash: Pbkdf2.hash_pwd_salt("password")
    }
  end

  @spec user_with_pw_factory() :: Dash.Accounts.User.t()
  def user_with_pw_factory do
    struct!(
      user_factory(),
      %{
        password: "password",
        password_confirmation: "password",
    }
      )
  end

  @spec user_with_nil_settings_factory() :: Dash.Accounts.User.t()
  def user_with_nil_settings_factory do
    struct!(
      user_factory(),
      %{
        settings: nil
    }
      )
  end

  @spec user_with_settings_factory() :: Dash.Accounts.User.t()
  def user_with_settings_factory do
    struct!(
      user_factory(),
      %{
        settings: build(:settings)
    }
      )
  end

  def settings_factory do
    %Settings{
      harvest_api_key: "123jkh12k123",
      harvest_account_id: "5678"
    }
  end
end

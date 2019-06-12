defmodule Dash.Factory do
  @moduledoc "Factory for test entries"
  alias Dash.Accounts.{Settings, User}
  use ExMachina.Ecto, repo: Dash.Repo

  @spec user_factory() :: Dash.Accounts.User.t()
  def user_factory do
    %User{
      name: "User",
      email: "email@place.com",
      password: "password",
      password_confirmation: "password",
      password_hash: Pbkdf2.hash_pwd_salt("password"),
      settings: build(:settings)
    }
  end

  @spec user2_factory() :: Dash.Accounts.User.t()
  def user2_factory do
    %User{
      name: "User2",
      email: "email2@otherplace.com",
      password: "password",
      password_confirmation: "password",
      password_hash: Pbkdf2.hash_pwd_salt("password")
    }
  end

  def settings_factory do
    %Settings{
      harvest_api_key: "123jkh12k123",
      harvest_account_id: "5678"
    }
  end

  def nil_settings_factory do
    %Settings{
      harvest_api_key: nil,
      harvest_account_id: nil
    }
  end
end

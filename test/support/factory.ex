defmodule Dash.Factory do
  @moduledoc "Factory for test entries"
  alias Dash.{Accounts, Github, Harvest}
  use ExMachina.Ecto, repo: Dash.Repo

  @spec user_factory() :: Accounts.User.t()
  def user_factory do
    %Accounts.User{
      name: "User",
      email: "email@place.com",
      password: "password",
      password_confirmation: "password",
      password_hash: Pbkdf2.hash_pwd_salt("password"),
      settings: build(:settings)
    }
  end

  @spec harvest_user_factory() :: Harvest.User.t()
  def harvest_user_factory do
    %Harvest.User{
      settings: build(:harvest_settings)
    }
  end

  @spec github_user_factory() :: Github.User.t()
  def github_user_factory do
    %Github.User{
      settings: build(:github_settings)
    }
  end

  @spec user2_factory() :: Accounts.User.t()
  def user2_factory do
    %Accounts.User{
      name: "User2",
      email: "email2@otherplace.com",
      password: "password",
      password_confirmation: "password",
      password_hash: Pbkdf2.hash_pwd_salt("password")
    }
  end

  def settings_factory do
    %Accounts.Settings{
      harvest_api_key: "123jkh12k123",
      harvest_account_id: "56781",
      github_username: "githubusername",
      github_api_token: "s8ad7f9s"
    }
  end

  def harvest_settings_factory do
    %Harvest.Settings{
      harvest_api_key: "123jkh12k123",
      harvest_account_id: "56781"
    }
  end

  def github_settings_factory do
    %Github.Settings{
      github_username: "githubusername",
      github_api_token: "s8ad7f9s"
    }
  end

  def nil_settings_factory do
    %Accounts.Settings{
      harvest_api_key: nil,
      harvest_account_id: nil,
      github_username: nil,
      github_api_token: nil
    }
  end
end

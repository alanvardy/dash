defmodule Dash.AccountsFactory do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      alias Dash.Accounts.{Settings, User}

      @spec user_factory() :: User.t()
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

      @spec user2_factory() :: User.t()
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
          harvest_account_id: "56781",
          github_username: "githubusername",
          github_api_token: "s8ad7f9s"
        }
      end

      def nil_settings_factory do
        %Settings{
          harvest_api_key: nil,
          harvest_account_id: nil,
          github_username: nil,
          github_api_token: nil
        }
      end
    end
  end
end

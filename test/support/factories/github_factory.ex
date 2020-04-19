defmodule Dash.GithubFactory do
  @moduledoc false
  defmacro __using__(_opts) do
    quote do
      alias Dash.Github.{Settings, User}

      @spec github_user_factory() :: User.t()
      def github_user_factory do
        %User{
          settings: build(:github_settings)
        }
      end

      def github_settings_factory do
        %Settings{
          github_username: "githubusername",
          github_api_token: "s8ad7f9s"
        }
      end
    end
  end
end

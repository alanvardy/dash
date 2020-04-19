defmodule Dash.HarvestFactory do
  @moduledoc false
  defmacro __using__(_opts) do
    quote do
      alias Dash.Harvest.{Settings, User}

      @spec harvest_user_factory() :: User.t()
      def harvest_user_factory do
        %User{
          settings: build(:harvest_settings)
        }
      end

      def harvest_settings_factory do
        %Settings{
          harvest_api_key: "123jkh12k123",
          harvest_account_id: "56781"
        }
      end
    end
  end
end

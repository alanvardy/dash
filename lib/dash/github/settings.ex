defmodule Dash.Github.Settings do
  use TypedEctoSchema
  @moduledoc "Stores all user settings"

  alias Dash.Github.User

  typed_schema "settings" do
    field :github_username, :string
    field :github_api_token, :string
    belongs_to :user, User

    timestamps()
  end
end

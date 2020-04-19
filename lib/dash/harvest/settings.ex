defmodule Dash.Harvest.Settings do
  use TypedEctoSchema
  @moduledoc "Stores all user settings"

  alias Dash.Harvest.User

  typed_schema "settings" do
    field(:harvest_account_id, :integer) :: pos_integer | nil
    field :harvest_api_key, :string
    belongs_to :user, User

    timestamps()
  end
end

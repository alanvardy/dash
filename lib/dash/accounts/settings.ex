defmodule Dash.Accounts.Settings do
  @moduledoc "Stores all user settings"

  alias Dash.Accounts.User
  import Ecto.Changeset
  use Ecto.Schema


  schema "settings" do
    field :harvest_account_id, :integer
    field :harvest_api_key, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(settings, attrs) do
    settings
    |> cast(attrs, [:harvest_api_key, :harvest_account_id, :user_id])
    |> validate_required(:user_id)
  end
end

defmodule Dash.Accounts.Settings do
  use Ecto.Schema
  @moduledoc "Stores all user settings"

  alias Dash.Accounts.User
  import Ecto.Changeset

  schema "settings" do
    field :harvest_account_id, :integer
    field :harvest_api_key, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(settings, attrs) do
    settings
    |> cast(attrs, [:harvest_api_key, :harvest_account_id])
    |> validate_both_or_none(:harvest_api_key, :harvest_account_id)
  end

  defp validate_both_or_none(changeset, field1, field2) do
    cond do
      present?(changeset, field1) && !present?(changeset, field2) ->
        add_error(changeset, field2, "#{field2} needs to be present if #{field1} is")

      present?(changeset, field2) && !present?(changeset, field1) ->
        add_error(changeset, field1, "#{field1} needs to be present if #{field2} is")

      true ->
        changeset
    end
  end

  defp present?(changeset, field) do
    value = get_field(changeset, field)
    value && value != ""
  end
end

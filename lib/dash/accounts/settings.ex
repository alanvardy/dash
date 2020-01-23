defmodule Dash.Accounts.Settings do
  use Ecto.Schema
  @moduledoc "Stores all user settings"

  alias Dash.Accounts.User
  import Ecto.Changeset

  @type t :: %__MODULE__{
          id: pos_integer | nil,
          harvest_account_id: integer | nil,
          harvest_api_key: String.t() | nil,
          github_username: String.t() | nil,
          github_api_token: String.t() | nil,
          user_id: pos_integer | nil,
          user: User.t() | nil
        }

  schema "settings" do
    field :harvest_account_id, :integer
    field :harvest_api_key, :string
    field :github_username, :string
    field :github_api_token, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  @spec changeset(t(), map) :: Ecto.Changeset.t()
  def changeset(settings, attrs) do
    settings
    |> cast(attrs, [:harvest_api_key, :harvest_account_id, :github_username, :github_api_token])
    |> validate_both_or_none(:harvest_api_key, :harvest_account_id)
    |> validate_both_or_none(:github_username, :github_api_token)
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

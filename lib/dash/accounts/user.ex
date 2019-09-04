defmodule Dash.Accounts.User do
  use Ecto.Schema
  @moduledoc "Site user"
  alias Dash.Accounts.Settings
  import Ecto.Changeset

  @type t :: %__MODULE__{
          id: integer,
          email: String.t(),
          name: String.t(),
          # password: String.t(),
          password_hash: String.t(),
          settings: map()
        }

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :password_hash, :string
    has_one :settings, Settings, on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :name, :password, :password_confirmation])
    |> validate_required([:email, :name, :password, :password_confirmation])
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(pass))

      _ ->
        changeset
    end
  end
end

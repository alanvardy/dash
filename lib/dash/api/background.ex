defmodule Dash.Api.Background do
  @moduledoc "Stored info for wallpaper pulled from Unsplash"
  alias Dash.Accounts.User
  use Ecto.Schema
  import Ecto.Changeset

  schema "backgrounds" do
    field :alt, :string
    field :date, :date
    field :description, :string
    field :first_name, :string
    field :last_name, :string
    field :link, :string
    field :profile_image, :string
    field :url, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(background, attrs) do
    background
    |> cast(attrs, [:link, :url, :alt, :description, :first_name, :last_name, :profile_image, :date, :user_id])
    |> validate_required([:link, :url, :alt, :first_name, :last_name, :profile_image, :date, :user_id])
  end
end

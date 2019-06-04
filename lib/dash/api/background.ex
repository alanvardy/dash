defmodule Dash.Api.Background do
  @moduledoc "Stored info for wallpaper pulled from Unsplash"
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

    timestamps()
  end

  @doc false
  def changeset(background, attrs) do
    background
    |> cast(attrs, [:link, :url, :alt, :description, :first_name, :last_name, :profile_image, :date])
    |> validate_required([:link, :url, :alt, :first_name, :last_name, :profile_image, :date])
  end
end

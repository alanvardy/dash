defmodule Dash.Repo.Migrations.CreateBackgrounds do
  use Ecto.Migration

  def change do
    create table(:backgrounds) do
      add :link, :string
      add :url, :string
      add :alt, :string
      add :description, :string
      add :first_name, :string
      add :last_name, :string
      add :profile_image, :string
      add :date, :date

      timestamps()
    end

  end
end

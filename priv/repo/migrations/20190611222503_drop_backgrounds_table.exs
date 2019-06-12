defmodule Dash.Repo.Migrations.DropBackgroundsTable do
  use Ecto.Migration

  def change do
    drop table(:backgrounds)
  end
end

defmodule Dash.Repo.Migrations.AddUserIdToBackgrounds do
  use Ecto.Migration

  def change do
    alter table(:backgrounds) do
      add :user_id, references(:users)
    end
  end
end

defmodule Dash.Repo.Migrations.CreateSettings do
  use Ecto.Migration

  def change do
    create table(:settings) do
      add :harvest_api_key, :string
      add :harvest_account_id, :integer
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:settings, [:user_id])
  end
end

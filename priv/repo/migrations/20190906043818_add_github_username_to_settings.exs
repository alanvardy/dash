defmodule Dash.Repo.Migrations.AddGithubUsernameToSettings do
  use Ecto.Migration

  def change do
    alter table(:settings) do
      add :github_username, :string
    end
  end
end

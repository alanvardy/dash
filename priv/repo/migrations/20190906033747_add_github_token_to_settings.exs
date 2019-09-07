defmodule Dash.Repo.Migrations.AddGithubTokenToSettings do
  use Ecto.Migration

  def change do
    alter table(:settings) do
      add :github_api_token, :string
    end
  end
end

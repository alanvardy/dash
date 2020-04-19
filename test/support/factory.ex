defmodule Dash.Factory do
  @moduledoc "Factory for test entries"
  use ExMachina.Ecto, repo: Dash.Repo
  use Dash.AccountsFactory
  use Dash.GithubFactory
  use Dash.HarvestFactory
end

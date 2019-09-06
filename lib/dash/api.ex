defmodule Dash.Api do
  @moduledoc "Logic around APIs"
  alias Dash.Accounts.User
  alias Dash.Api.{Backgrounds, Github, Harvest}

  @doc "returns a view friendly list of maps"
  @spec get_harvest(User.t()) :: map
  def get_harvest(user), do: Harvest.get(user)

  @spec get_background(User.t()) :: map
  def get_background(user), do: Backgrounds.get(user)

  @doc "Return a new background from Unsplash as a map"
  @spec new_background(User.t()) :: map
  def new_background(user), do: Backgrounds.new(user)

  @spec get_issues(User.t()) :: [any]
  def get_issues(user), do: Github.issues(user)
end

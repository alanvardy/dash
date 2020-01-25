defmodule Dash.Api do
  @moduledoc "Logic around APIs"
  alias Dash.Api.{Backgrounds, Github, Harvest}

  @doc "returns a view friendly list of maps"
  defdelegate get_harvest(user), to: Harvest, as: :get

  @doc "Check for an existing Unsplash background"
  defdelegate get_background(user), to: Backgrounds, as: :get

  @doc "Return a new background from Unsplash as a map"
  defdelegate new_background(user), to: Backgrounds, as: :new

  @doc "Get Github Issues and Pull requests"
  defdelegate get_issues(user), to: Github, as: :issues
end

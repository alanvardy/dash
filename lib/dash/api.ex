defmodule Dash.Api do
  @moduledoc "Logic around APIs"
  alias Dash.Api.{Backgrounds, Harvest}

  @doc "returns a view friendly list of maps"
  def get_harvest(user), do: Harvest.get(user)

  @spec get_background(atom | %{id: any}) :: map
  def get_background(user), do: Backgrounds.get(user)

  @spec new_background(atom | %{id: any}) :: map
  def new_background(user), do: Backgrounds.new(user)
end

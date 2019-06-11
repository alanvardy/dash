defmodule Dash.Backgrounds.Store do
  @moduledoc "Stores user backgrounds ephemerally"
  use Agent

  def start_link(_opts) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def value(key) do
    Agent.get(__MODULE__, fn map -> Map.get(map, key) end)
  end

  def random do
    Agent.get(__MODULE__, fn map -> Enum.random(map) end)
  end

  def update(key, value) do
    Agent.update(__MODULE__, fn map -> Map.put(map, key, value) end)
  end
end

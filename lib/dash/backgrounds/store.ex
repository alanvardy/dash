defmodule Dash.Backgrounds.Store do
  @moduledoc "Stores user backgrounds ephemerally"
  use Agent

  @spec start_link(any) :: {:error, any} | {:ok, pid}
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  @spec value(Integer.t()) :: Map.t()
  def value(key) do
    Agent.get(__MODULE__, fn map -> Map.get(map, key) end)
  end

  @spec random :: Map.t()
  def random do
    Agent.get(__MODULE__, fn map -> Enum.random(map) end)
  end

  @spec update(Integer.t(), Map.t()) :: :ok
  def update(key, value) do
    Agent.update(__MODULE__, fn map -> Map.put(map, key, value) end)
  end
end

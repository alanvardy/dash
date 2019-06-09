defmodule Dash.Api do
  @moduledoc "Logic around APIs"
  alias Dash.Api.Harvest
  alias Dash.Api.Time

  @doc "returns a view friendly list of maps"
  def get_harvest(%{settings: %{harvest_api_key: nil, harvest_account_id: nil}}),
    do: []

  def get_harvest(%{settings: %{harvest_api_key: api_key, harvest_account_id: account_id}}) do
    %{harvest: %{api_key: api_key, account_id: account_id}}
    |> Harvest.projects()
    |> Enum.map(fn x ->
      x
      |> Map.put(:days_left, Time.days_left())
      |> Map.put(:month, Time.month())
    end)
    |> Enum.map(fn x ->
      x
      |> Map.put(:weekdays_left, Time.weekdays_left(x.days_left))
    end)
    |> Enum.map(fn x ->
      x
      |> Map.put(:hours_per_day, Time.hours_per_day(x))
    end)
  end

  def get_harvest(_), do: []
end

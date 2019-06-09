defmodule Dash.Api do
  @moduledoc "Logic around APIs"
  alias Dash.Api.Harvest
  alias Dash.Api.Time

  @doc "returns a view friendly list of maps"
  def get_harvest(%{settings: %{harvest_api_key: nil, harvest_account_id: nil}}),
    do: []

  def get_harvest(%{settings: %{harvest_api_key: _x, harvest_account_id: _y}} = user) do
    user
    |> Harvest.add_credentials()
    |> Harvest.projects()
    |> Time.add_countdown()
    |> IO.inspect(label: "!!!!INSPECT!!!!")
    # |> Enum.map(fn x ->
    #   x
    #   |> Map.put(:days_left, Time.days_left())
    #   |> Map.put(:month, Time.month())
    # end)
    # |> Enum.map(fn x ->
    #   x
    #   |> Map.put(:weekdays_left, Time.weekdays_left(x.days_left))
    # end)
    |> Time.add_hours_per_day()

    # |> Enum.map(fn x ->
    #   x
    #   |> Map.put(:hours_per_day, Time.hours_per_day(x))
    # end)
  end

  def get_harvest(_), do: []
end

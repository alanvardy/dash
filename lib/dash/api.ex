defmodule Dash.Api do
  @moduledoc "Logic around APIs"
  alias Dash.Api.{Harvest, Report, Time}

  @doc "returns a view friendly list of maps"
  def get_harvest(%{settings: %{harvest_api_key: nil, harvest_account_id: nil}}),
    do: []

  def get_harvest(%{settings: %{harvest_api_key: _x, harvest_account_id: _y}} = user) do
    %Report{}
    |> Harvest.add_credentials(user)
    |> Harvest.add_time_entries()
    |> Harvest.add_projects()
    |> Time.add_countdown()
    |> Time.add_hours_per_day()
    |> Time.add_nice_hours()
  end

  def get_harvest(_), do: []
end

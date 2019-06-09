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
    |> Time.add_hours_per_day()
  end

  def get_harvest(_), do: []
end

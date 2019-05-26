defmodule DashWeb.Api do
  @moduledoc "Logic around APIs"
  alias Dash.Accounts.Settings
  alias Dash.Accounts.User
  alias DashWeb.Api.Harvest
  alias DashWeb.Api.Time

  @doc "Gets all reports from Harvest API"
  @spec get_harvest_reports(%User{}) :: [Map.t()]
  def get_harvest_reports(user) do
    Harvest.projects(user)
  end

  @doc "Gets all time entries from Harvest API"
  @spec get_time_entries(%User{}) :: [Map.t()]
  def get_time_entries(user) do
    Harvest.time_entries(user)
  end

  @doc "returns a view friendly list of maps"
  def interpret_reports(%User{settings: %Settings{harvest_api_key: nil, harvest_account_id: nil}}), do: []
  def interpret_reports(%User{settings: %Settings{harvest_api_key: _key, harvest_account_id: _id}} = user) do
    first_step =
      Enum.map(Harvest.projects(user), fn x ->
        x
        |> Map.put(:days_left, Time.days_left())
        |> Map.put(:month, Time.month())
      end)

    second_step =
      Enum.map(first_step, fn x ->
        x
        |> Map.put(:weekdays_left, Time.weekdays_left(x.days_left))
      end)

    Enum.map(second_step, fn x ->
      x
      |> Map.put(:hours_per_day, hours_per_day(x))
    end)
  end
  def interpret_reports(_), do: []

  defp hours_per_day(map) do
    map
    |> Map.get(:budget)
    |> Time.hours_per_day(map.hours, map.weekdays_left)
    |> Float.round(2)
  end
end

defmodule DashWeb.Api do
  alias DashWeb.Api.Harvest
  alias DashWeb.Api.Time

  @doc "Gets all reports from Harvest API"
  @spec get_harvest_reports() :: [Map.t()]
  def get_harvest_reports() do
    Harvest.projects()
  end

  @doc "Gets all time entries from Harvest API"
  @spec get_time_entries() :: [Map.t()]
  def get_time_entries() do
    Harvest.time_entries()
  end

  @doc "returns a view friendly list of maps"
  @spec interpret_reports() :: [Map.t()]
  def interpret_reports() do
    first_step = Enum.map(Harvest.projects(), fn x ->
      x
      |> Map.put(:days_left, Time.days_left())
      |> Map.put(:month, Time.month())
    end)
    second_step = Enum.map(first_step, fn x ->
      x
      |> Map.put(:weekdays_left, Time.weekdays_left(x.days_left))
    end)

    Enum.map(second_step, fn x ->
      x
      |> Map.put(:hours_per_day, Time.hours_per_day(x.budget, x.hours, x.weekdays_left))
    end)
  end
end

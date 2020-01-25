defmodule Dash.Api.Harvest.Time do
  @moduledoc "Does time stuff and things"

  alias Dash.Api.Harvest.Report

  @spec add_countdown(Report.t()) :: {:ok, Report.t()}
  def add_countdown(%Report{} = data) do
    days_left = days_left()

    {:ok,
     %Report{
       data
       | time: %{
           days_left: days_left,
           weekdays_left: weekdays_left(days_left),
           month: month()
         }
     }}
  end

  @spec add_hours_per_day(Report.t()) :: {:ok, Report.t()}
  def add_hours_per_day(%Report{time: %{weekdays_left: weekdays_left}} = data) do
    projects =
      Enum.map(data.projects, fn x ->
        Map.put(x, :hours_per_day, hours_per_day(x, weekdays_left))
      end)

    {:ok, %Report{data | projects: projects}}
  end

  @spec add_nice_hours(Report.t()) :: {:ok, Report.t()}
  def add_nice_hours(%Report{projects: projects} = data) do
    projects =
      Enum.map(projects, fn x ->
        Map.put(x, :nice_hours, nice_hours(x.hours_per_day))
      end)

    {:ok, %Report{data | projects: projects}}
  end

  @spec days_left() :: non_neg_integer()
  defp days_left do
    today = Timex.today()
    Timex.diff(Timex.end_of_month(today), today, :days)
  end

  @spec weekdays_left(integer()) :: non_neg_integer()
  defp weekdays_left(days_left) do
    today = Timex.today()

    1..days_left
    |> Enum.map(fn x -> Timex.shift(today, days: x) end)
    |> Enum.map(fn x -> Timex.weekday(x) end)
    |> Enum.reject(fn x -> x == 6 || x == 7 end)
    |> Enum.count()
  end

  @spec month() :: String.t()
  defp month do
    {:ok, month} =
      Timex.today()
      |> Timex.format("%B", :strftime)

    month
  end

  @spec current_month?(binary) :: boolean
  def current_month?(date) do
    [year, month, _day] = String.split(date, "-")
    current_date = Timex.today()
    {:ok, current_month} = Timex.format(current_date, "%m", :strftime)
    {:ok, current_year} = Timex.format(current_date, "%Y", :strftime)

    current_month == month && current_year == year
  end

  @spec hours_per_day(integer(), integer(), integer()) :: float()
  def hours_per_day(budget, hours, 0), do: budget - hours
  def hours_per_day(budget, hours, days_left), do: (budget - hours) / days_left

  @spec hours_per_day(%{budget: number, hours: number}, number) :: float
  def hours_per_day(%{budget: budget, hours: hours}, weekdays_left) do
    budget
    |> hours_per_day(hours, weekdays_left)
    |> Float.round(2)
  end

  defp nice_hours(hours) do
    minutes = trunc(hours * 60)

    if minutes >= 60 do
      "#{div(minutes, 60)}h:#{rem(minutes, 60)}m"
    else
      "#{minutes}m"
    end
  end
end

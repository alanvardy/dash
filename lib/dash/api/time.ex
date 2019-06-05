defmodule Dash.Api.Time do
  @moduledoc "Does time stuff and things"

  @spec days_left() :: non_neg_integer()
  def days_left do
    today = Timex.today()
    Timex.diff(Timex.end_of_month(today), today, :days)
  end

  @spec weekdays_left(integer()) :: non_neg_integer()
  def weekdays_left(days_left) do
    today = Timex.today()

    1..days_left
    |> Enum.map(fn x -> Timex.shift(today, days: x) end)
    |> Enum.map(fn x -> Timex.weekday(x) end)
    |> Enum.reject(fn x -> x == 6 || x == 7 end)
    |> Enum.count()
  end

  @spec month() :: String.t()
  def month do
    {:ok, month} =
      Timex.today()
      |> Timex.format("%B", :strftime)

    month
  end

  def current_month?(date) do
    [year, month, _day] = String.split(date, "-")
    current_date = Timex.today()
    {:ok, current_month} = Timex.format(current_date, "%m", :strftime)
    {:ok, current_year} = Timex.format(current_date, "%Y", :strftime)

    current_month == month && current_year == year
  end

  @spec hours_per_day(Integer.t(), Integer.t(), Integer.t()) :: Float.t()
  def hours_per_day(budget, hours, 0), do: budget - hours
  def hours_per_day(budget, hours, days_left), do: (budget - hours) / days_left

  def hours_per_day(map) do
    map
    |> Map.get(:budget)
    |> hours_per_day(map.hours, map.weekdays_left)
    |> Float.round(2)
  end
end

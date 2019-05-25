defmodule DashWeb.Api.Time do
  @moduledoc "Does time stuff and things"

  @spec days_left() :: non_neg_integer()
  def days_left do
    today = Timex.today()
    Timex.diff(Timex.end_of_month(today), today, :days)
  end

  @spec weekdays_left(integer()) :: non_neg_integer()
  def weekdays_left(days_left) do
    today = Timex.today()

    0..days_left
    |> Enum.map(fn x -> Timex.shift(today, days: x) end)
    |> Enum.map(fn x -> Timex.weekday(x) end)
    |> Enum.reject(fn x -> (x == 6) || (x == 7) end)
    |> Enum.count
  end

  @spec month() :: String.t()
  def month do
    {:ok, month} = Timex.today()
    |> Timex.format("%B", :strftime)

    month
  end

  @spec hours_per_day(Integer.t(), Integer.t(), Integer.t()) :: Float.t()
  def hours_per_day(budget, hours, days_left) do
    (budget - hours) / days_left
  end
end

defmodule Dash.Harvest.TimeTest do
  @moduledoc false

  use Dash.DataCase, async: true
  use ExUnitProperties
  alias Dash.Harvest.Time

  describe "hours_per_day/3" do
    test "returns budget hours value when given zero days" do
      assert Time.hours_per_day(3, 2, 0) == 1
    end

    property "Always returns a number" do
      check all budget <- float(min: 0),
                hours <- float(min: 0),
                days_left <- integer(0..31) do
        result = Time.hours_per_day(budget, hours, days_left)

        assert is_number(result)
      end
    end

    property "Returns a positive number when hours are less than budget" do
      check all num1 <- float(min: 1),
                num2 <- float(min: 1),
                days_left <- integer(0..31) do
        result = Time.hours_per_day(num1 + num2, num1, days_left)

        assert result >= 0
      end
    end
  end

  describe "nice_hours/1" do
    test "uses 2 zeros for minutes" do
      assert Time.nice_hours(2) == "2h:00m"
    end

    property "always returns a string" do
      check all hours <- float() do
        hours
        |> Time.nice_hours()
        |> is_binary()
        |> assert
      end
    end

    property "Does not contain negative signs" do
      check all hours <- float() do
        hours
        |> Time.nice_hours()
        |> String.contains?("-")
        |> refute()
      end
    end

    property "contains hours when greater than or equal to 60" do
      check all hours <- float(min: 1) do
        hours
        |> Time.nice_hours()
        |> String.contains?("h:")
        |> assert()
      end
    end
  end
end

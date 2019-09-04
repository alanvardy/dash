defmodule DashWeb.TimeTest do
  @moduledoc false
  alias Dash.Api.Harvest.Time
  use Dash.DataCase, async: true

  describe "hours_per_day/3" do
    test "returns budget hours value when given zero days" do
      assert Time.hours_per_day(3, 2, 0) == 1
    end
  end
end

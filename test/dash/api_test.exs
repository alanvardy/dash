defmodule DashTest do
  @moduledoc false
  alias Dash.Harvest
  alias Dash.Harvest.Report
  import Dash.Factory
  use Dash.DataCase, async: true

  describe "get_harvest/1" do
    test "errors when passed a nil value" do
      assert Harvest.get(nil) == {:error, "No harvest credentials"}
    end

    test "errors when passed a user without the api details" do
      settings = insert(:nil_settings)
      user = insert(:user, settings: settings)
      assert Harvest.get(user) == {:error, "No harvest credentials"}
    end

    test "returns a struct when passed a valid user" do
      user = insert(:user)

      assert {:ok, %Report{}} = Harvest.get(user)
    end
  end
end

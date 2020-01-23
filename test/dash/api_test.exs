defmodule Dash.ApiTest do
  @moduledoc false
  alias Dash.Api
  alias Dash.Api.Harvest.Report
  import Dash.Factory
  use Dash.DataCase, async: true

  describe "get_harvest/1" do
    test "errors when passed a nil value" do
      assert Api.get_harvest(nil) == {:error, "No harvest credentials"}
    end

    test "errors when passed a user without the api details" do
      settings = insert(:nil_settings)
      user = insert(:user, settings: settings)
      assert Api.get_harvest(user) == {:error, "No harvest credentials"}
    end

    test "returns a struct when passed a valid user" do
      user = insert(:user)

      assert {:ok, %Report{}} = Api.get_harvest(user)
    end
  end
end

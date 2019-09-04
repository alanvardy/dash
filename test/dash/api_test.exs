defmodule Dash.ApiTest do
  @moduledoc false
  alias Dash.Api
  alias Dash.Api.Harvest.Report
  import Dash.Factory
  use Dash.DataCase, async: true

  describe "get_harvest/1" do
    test "returns an empty list when passed a nil value" do
      assert Api.get_harvest(nil) == []
    end

    test "returns an empty list when passed a user without the api details" do
      settings = insert(:nil_settings)
      user = insert(:user, settings: settings)
      assert Api.get_harvest(user) == []
    end

    test "returns a map when passed a valid user" do
      user = insert(:user)

      assert %Report{} = Api.get_harvest(user)
    end
  end
end

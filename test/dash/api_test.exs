defmodule Dash.ApiTest do
  @moduledoc false
  alias DashWeb.Api
  import Dash.Factory
  use Dash.DataCase, async: true

  describe "interpret_reports/1" do
    test "returns an empty list when passed a nil value" do
      assert Api.interpret_reports(nil) == []
    end

    test "returns an empty list when passed a user without the api details" do
      settings = insert(:nil_settings)
      user = insert(:user, settings: settings)
      assert Api.interpret_reports(user) == []
    end

    test "returns a map when passed a valid user" do
      user = insert(:user)
      assert [%{}|_] = Api.interpret_reports(user)
    end
  end
end

defmodule Dash.GithubRequesterTest do
  @moduledoc false
  alias Dash.Github.Requester
  use Dash.DataCase, async: true
  import Dash.Factory

  describe "init" do
    test "does nothing special" do
      assert Requester.init(%{}) == {:ok, %{}}
    end
  end

  describe "handle_info" do
    test "gets issues and sends to the parent" do
      state = %{parent: self(), user: insert(:user)}
      assert Requester.handle_info(:tick, state) == {:noreply, state}
      assert_received {:"$gen_cast", {:update_issues, []}}
    end
  end
end

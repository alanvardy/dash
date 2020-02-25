defmodule Dash.GithubServerTest do
  @moduledoc false
  alias Dash.Api.Github.Server
  use Dash.DataCase, async: true
  import Dash.Factory

  describe "init" do
    test "starts with issues: nil" do
      user = insert(:user)
      assert Server.init(%{user_id: user.id}) == {:ok, %{issues: nil}}
    end
  end

  describe "handle_call" do
    test "responds with issues" do
      assert Server.handle_call(:issues, "from", %{issues: "issues"}) ==
               {:reply, "issues", %{issues: "issues"}}
    end
  end

  describe "handle_cast" do
    test "updates issues" do
      assert Server.handle_cast({:update_issues, "other issues"}, %{issues: "issues"}) ==
               {:noreply, %{issues: "other issues"}}
    end
  end
end

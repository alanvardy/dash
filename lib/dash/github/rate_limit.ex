defmodule Dash.Github.RateLimit do
  @moduledoc """
  Checking GitHub for how many responses remain,
  doesn't count towards cap.
  Current rate limit as of Apr 2020 is 5k/hour
  """

  alias Dash.Accounts.User
  alias Dash.Github.Request

  @spec check_remaining(Dash.Accounts.User.t()) :: :ok | {:error, :rate_limit}
  def check_remaining(user) do
    %User{settings: %{github_username: username, github_api_token: token}} = user
    env = Application.get_env(:dash, :env)
    response = Request.get("rate_limit", username, token)

    case {env, response} do
      {:test, _} ->
        :ok

      {_, {:ok, _headers, %{"rate" => %{"remaining" => remaining}}}} when remaining > 100 ->
        :ok

      _ ->
        {:error, :rate_limit}
    end
  end
end

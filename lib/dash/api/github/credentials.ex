defmodule Dash.Api.Github.Credentials do
  @moduledoc "Checks GitHub credentials"
  alias Dash.Accounts.User

  @spec(exist?(User.t()) :: :ok, {:error, binary})
  def exist?(%User{settings: %{github_username: username, github_api_token: token}})
      when is_binary(username) and is_binary(token),
      do: :ok

  def exist?(%User{}), do: {:error, "No Github Credentials"}
end

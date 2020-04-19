defmodule Dash.Harvest.Credentials do
  @moduledoc "Checks user credentials for Harvest"
  alias Dash.Accounts.User
  alias Dash.Harvest.Report

  @spec add(User.t()) :: {:ok, Report.t()} | {:error, binary}
  def add(%User{
        settings: %{
          harvest_api_key: api_key,
          harvest_account_id: account_id
        }
      })
      when not is_nil(api_key) and not is_nil(account_id) do
    {:ok, %Report{keys: %{api_key: api_key, account_id: account_id}}}
  end

  def add(_user), do: {:error, "No harvest credentials"}
end

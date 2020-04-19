defmodule Dash.Harvest do
  @moduledoc "For interacting with the Harvest API"
  alias Dash.Accounts.User
  alias Dash.Harvest.{Credentials, Filter, Report, Request, Server, Time}

  @spec get(User.t()) :: {:ok, Report.t()} | {:error, binary}
  def get(user) do
    with {:ok, report} <- Credentials.add(user),
         {:ok, report} <- Request.projects(report),
         {:ok, report} <- Request.time_entries(report),
         {:ok, report} <- Filter.entry_keys(report),
         {:ok, report} <- Filter.report_keys(report),
         {:ok, report} <- Time.add_countdown(report),
         {:ok, report} <- Time.add_hours_per_day(report),
         {:ok, report} <- Time.add_nice_hours(report) do
      {:ok, report}
    else
      {:error, message} -> {:error, message}
    end
  end

  defdelegate fetch(user_id), to: Server
  defdelegate update(pid, user_id), to: Server
end

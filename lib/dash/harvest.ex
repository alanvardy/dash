defmodule Dash.Harvest do
  use Boundary, deps: [Dash.{Accounts, Repo}], exports: []
  @moduledoc "For interacting with the Harvest API"

  alias Dash.Harvest.{Credentials, Filter, Report, Request, Server, Time, User}

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

  @spec fetch(pos_integer) :: nil | [map]
  defdelegate fetch(user_id), to: Server
  @spec update(atom | pid | {atom, any} | {:via, atom, any}, any) :: :ok
  defdelegate update(pid, user_id), to: Server
end

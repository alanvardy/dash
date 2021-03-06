defmodule Dash.Harvest.Request do
  @moduledoc "Makes requests to the Harvest API"
  use Retry
  alias Dash.Harvest.{FakeData, Report}
  @options [ssl: [{:versions, [:"tlsv1.2"]}], recv_timeout: 5000]

  @doc "Pull in all projects as a map"
  @spec projects(Report.t()) :: {:ok, Report.t()}
  def projects(%Report{} = report) do
    case get(report, "/v2/projects", "projects") do
      {:ok, projects} -> {:ok, %Report{report | projects: projects}}
      error -> error
    end
  end

  @doc "Pull in all time entries as a map"
  @spec time_entries(Report.t()) :: {:ok, Report.t()}
  def time_entries(%Report{} = report) do
    case get(report, "/v2/time_entries", "time_entries") do
      {:ok, time_entries} -> {:ok, %Report{report | time_entries: time_entries}}
      error -> error
    end
  end

  # make a get request to the Harvest API
  defp get(%Report{keys: keys}, address, key) do
    case Application.get_env(:dash, :env) do
      :test ->
        data = address |> FakeData.generate() |> Map.get(key)
        {:ok, data}

      # coveralls-ignore-start
      _ ->
        headers = build_headers(keys)

        with {:ok, %{status_code: 200} = response} <-
               HTTPoison.get("https://api.harvestapp.com/api#{address}", headers, @options),
             {:ok, body} <- Map.fetch(response, :body),
             {:ok, decoded} <- Poison.decode(body),
             {:ok, entry} <- Map.fetch(decoded, key) do
          {:ok, entry}
        else
          error -> error
        end
    end
  end

  defp build_headers(%{api_key: api_key, account_id: account_id}) do
    [
      Authorization: "Bearer #{api_key}",
      "Harvest-Account-ID": account_id
    ]
  end

  # coveralls-ignore-stop
end

defmodule Dash.Api.Harvest do
  @moduledoc "For interacting with the Harvest API"
  alias Dash.Api.Time
  use Retry

  @options [ssl: [{:versions, [:"tlsv1.2"]}], recv_timeout: 2000]

  def add_credentials(%{
        settings: %{
          harvest_api_key: api_key,
          harvest_account_id: account_id
        }
      }) do
    %{harvest: %{api_key: api_key, account_id: account_id}}
  end

  # Pull in all projects as a map
  def add_projects(data) do
    projects =
      get("/v2/projects", data)
      |> Map.get("projects")
      |> report_keys(data)

    Map.put(data, :projects, projects)
  end

  # Pull in all time entries as a map
  def add_time_entries(data) do
    time_entries =
      get("/v2/time_entries", data)
      |> Map.get("time_entries")
      |> entry_keys()

    Map.put(data, :time_entries, time_entries)
  end

  @doc "cherry pick the report attributes we want"
  def report_keys(projects, data) do
    projects
    |> Enum.filter(fn b -> Map.get(b, "budget") end)
    |> Enum.map(fn b ->
      %{
        id: Map.get(b, "id"),
        budget:
          b
          |> Map.get("budget")
          |> trunc(),
        name: Map.get(b, "name"),
        client:
          b
          |> Map.get("client")
          |> Map.get("name"),
        fee:
          b
          |> Map.get("fee")
          |> trunc(),
        hours: get_hours(b, data)
      }
    end)
  end

  @doc "cherry pick the time attributes we want"
  def entry_keys(time_entries) do
    time_entries
    |> Enum.filter(fn x -> Map.get(x, "project") end)
    |> Enum.map(fn x ->
      %{
        project_id:
          x
          |> Map.get("project")
          |> Map.get("id"),
        hours: Map.get(x, "hours"),
        spent_date: Map.get(x, "spent_date")
      }
    end)
  end

  # get total hours spent on a project
  defp get_hours(item, data) do
    data.time_entries
    |> Enum.filter(fn y -> y.project_id == Map.get(item, "id") end)
    |> Enum.filter(fn y -> Time.current_month?(y.spent_date) end)
    |> Enum.map(fn y -> round_to_nearest_quarter(y.hours) end)
    |> Enum.reduce(0, fn y, acc -> y + acc end)
  end

  # Round a float to the nearest .25
  defp round_to_nearest_quarter(number) when is_float(number) do
    primary =
      number
      |> Float.round(2)
      |> Kernel.*(100)
      |> Kernel.trunc()

    remainder = if rem(primary, 25) > 12, do: 25, else: 0

    primary
    |> div(25)
    |> Kernel.*(25)
    |> Kernel.+(remainder)
    |> Kernel./(100)
  end

  defp round_to_nearest_quarter(number) when is_integer(number), do: number

  # make a get request to the Harvest API
  def get(address, data) do
    case Mix.env() do
      :test ->
        Dash.FakeData.generate(address)

      # coveralls-ignore-start
      _ ->
        headers = get_headers(data.harvest)

        response =
          retry with: exponential_backoff() |> cap(1_000) |> expiry(10_000),
                rescue_only: [HTTPoison.Error] do
            HTTPoison.get!("https://api.harvestapp.com/api#{address}", headers, @options)
          after
            result -> result
          else
            error -> error
          end

        response
        |> Map.get(:body)
        |> Poison.decode!()
    end
  end

  defp get_headers(harvest) do
    [
      Authorization: "Bearer #{harvest.api_key}",
      "Harvest-Account-ID": harvest.account_id
    ]
  end

  # coveralls-ignore-stop
end

defmodule Dash.Api.Harvest do
  @moduledoc "For interacting with the Harvest API"
  alias Dash.Accounts.User
  alias Dash.Api.{Report, Time}
  use Retry

  @options [ssl: [{:versions, [:"tlsv1.2"]}], recv_timeout: 2000]

  @spec add_credentials(Dash.Api.Report.t(), Dash.Accounts.User.t()) :: Dash.Api.Report.t()
  def add_credentials(%Report{}, %User{
        settings: %{
          harvest_api_key: api_key,
          harvest_account_id: account_id
        }
      }) do
    %Report{keys: %{api_key: api_key, account_id: account_id}}
  end

  @spec api_calls(Dash.Api.Report.t()) :: Dash.Api.Report.t()
  def api_calls(%Report{} = data) do
    projects = Task.async(fn -> get_projects(data) end)
    time_entries = Task.async(fn -> get_time_entries(data) end)

    time_entries = entry_keys(Task.await(time_entries))
    projects = report_keys(Task.await(projects), time_entries)
    %Report{data | projects: projects, time_entries: time_entries}
  end

  # Pull in all projects as a map
  @spec get_projects(Dash.Api.Report.t()) :: map()
  def get_projects(%Report{} = data) do
    get("/v2/projects", data)
    |> Map.get("projects")
  end

  # Pull in all time entries as a map
  @spec get_time_entries(Dash.Api.Report.t()) :: map()
  def get_time_entries(%Report{} = data) do
    get("/v2/time_entries", data)
    |> Map.get("time_entries")
  end

  # cherry pick the report attributes we want
  defp report_keys(projects, time_entries) do
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
        hours: get_hours(b, time_entries)
      }
    end)
  end

  defp entry_keys(time_entries) do
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
  defp get_hours(item, time_entries) do
    time_entries
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
  defp get(address, %Report{keys: keys}) do
    case Mix.env() do
      :test ->
        Dash.FakeData.generate(address)

      # coveralls-ignore-start
      _ ->
        headers = get_headers(keys)

        %{body: body} =
          retry with: exponential_backoff() |> cap(1_000) |> expiry(10_000),
                rescue_only: [HTTPoison.Error] do
            HTTPoison.get!("https://api.harvestapp.com/api#{address}", headers, @options)
          after
            result -> result
          else
            error -> error
          end

        Poison.decode!(body)
    end
  end

  defp get_headers(%{api_key: api_key, account_id: account_id}) do
    [
      Authorization: "Bearer #{api_key}",
      "Harvest-Account-ID": account_id
    ]
  end

  # coveralls-ignore-stop
end

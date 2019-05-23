defmodule DashWeb.Api.Harvest do
  alias DashWeb.FakeData

  @moduledoc """
    For interacting with the Harvest API
  """
  @api_key Application.get_env(:dash, :harvest_api_key)
  @account_id Application.get_env(:dash, :harvest_account_id)
  @skip_api Application.get_env(:dash, :skip_api)

  @headers [
    Authorization: "Bearer #{@api_key}",
    "Harvest-Account-ID": @account_id,
    "User-Agent": "Alan Vardy"
  ]
  @options [ssl: [{:versions, [:"tlsv1.2"]}], recv_timeout: 2000]

  # Pull in all projects as a map
  @spec projects() :: [Map.t()]
  def projects do
    cond do
      @skip_api ->
        FakeData.projects()

      true ->
        get("/v2/projects")
        |> Map.get("projects")
        |> report_keys()
    end
  end

  # Pull in all time entries as a map
  @spec time_entries() :: [Map.t()]
  def time_entries do
    cond do
      @skip_api ->
        FakeData.time_entries()

      true ->
        get("/v2/time_entries")
        |> Map.get("time_entries")
        |> entry_keys()
    end
  end

  @doc "cherry pick the report attributes we want"
  def report_keys(projects) do
    projects
    |> Enum.filter(fn b -> Map.get(b, "budget") end)
    |> Enum.map(fn b ->
      %{
        id: Map.get(b, "id"),
        budget:
          b
          |> Map.get("budget")
          |> trunc(),
        client:
          b
          |> Map.get("client")
          |> Map.get("name"),
        fee:
          b
          |> Map.get("fee")
          |> trunc(),
        hours: get_hours(b)
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
  defp get_hours(item) do
    time_entries()
    |> Enum.filter(fn y -> y.project_id == Map.get(item, "id") end)
    |> Enum.map(fn y -> round_to_nearest_quarter(y.hours) end)
    |> Enum.reduce(0, fn y, acc -> y + acc end)
    |> Float.round(2)
  end

  # Round a float to the nearest .25
  defp round_to_nearest_quarter(number) do
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

  # make a get request to the Harvest API
  defp get(address) do
    "https://api.harvestapp.com/api#{address}"
    |> HTTPoison.get!(@headers, @options)
    |> Map.get(:body)
    |> Poison.decode!()
  end
end

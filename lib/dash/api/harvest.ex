defmodule DashWeb.Api.Harvest do
  @moduledoc "For interacting with the Harvest API"
  alias Dash.FakeData

  @options [ssl: [{:versions, [:"tlsv1.2"]}], recv_timeout: 2000]

  # Pull in all projects as a map
  @spec projects(%Dash.Accounts.User{}) :: [any]
  def projects(user) do
    get("/v2/projects", user)
    |> Map.get("projects")
    |> report_keys(user)
  end

  # Pull in all time entries as a map
  @spec time_entries(%Dash.Accounts.User{}) :: [Map.t()]
  def time_entries(user) do
    get("/v2/time_entries", user)
    |> Map.get("time_entries")
    |> entry_keys()
  end

  @doc "cherry pick the report attributes we want"
  def report_keys(projects, user) do
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
        hours: get_hours(b, user)
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
  defp get_hours(item, user) do
    user
    |> time_entries
    |> Enum.filter(fn y -> y.project_id == Map.get(item, "id") end)
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
  def get(address, user) do
    case Mix.env() do
      :test ->
        FakeData.generate(address)

      # coveralls-ignore-start
      _ ->
        headers = get_headers(user)

        "https://api.harvestapp.com/api#{address}"
        |> HTTPoison.get!(headers, @options)
        |> Map.get(:body)
        |> Poison.decode!()
    end
  end

  defp get_headers(user) do
    [
      Authorization: "Bearer #{user.settings.harvest_api_key}",
      "Harvest-Account-ID": user.settings.harvest_account_id
    ]
  end

  # coveralls-ignore-stop
end

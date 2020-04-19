defmodule Dash.Harvest.Filter do
  @moduledoc "Turns raw API data into something usable"
  alias Dash.Harvest.{Report, Time}

  @doc "Cherry pick the report attributes we want"
  @spec report_keys(Report.t()) :: {:ok, Report.t()}
  def report_keys(%Report{projects: projects, time_entries: time_entries} = report) do
    projects =
      projects
      |> Enum.filter(fn b -> has_budget?(b) && is_active?(b) end)
      |> Enum.map(fn b ->
        %{
          id: Map.get(b, "id"),
          budget:
            b
            |> Map.get("budget")
            |> truncate(),
          name: Map.get(b, "name"),
          client:
            b
            |> Map.get("client")
            |> Map.get("name"),
          fee:
            b
            |> Map.get("fee")
            |> truncate(),
          hours: get_hours(b, time_entries)
        }
      end)

    {:ok, %Report{report | projects: projects}}
  end

  @doc "Cherry pick the time entry keys we want"
  @spec entry_keys(Report.t()) :: {:ok, Report.t()}
  def entry_keys(%Report{time_entries: time_entries} = report) do
    time_entries =
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

    {:ok, %Report{report | time_entries: time_entries}}
  end

  defp has_budget?(project) do
    Map.get(project, "budget")
  end

  defp is_active?(project) do
    Map.get(project, "is_active")
  end

  # get total hours spent on a project
  defp get_hours(item, time_entries) do
    time_entries
    |> Enum.filter(fn y -> y.project_id == Map.get(item, "id") end)
    |> Enum.filter(fn y -> Time.current_month?(y.spent_date) end)
    |> Enum.map(fn y -> round_to_nearest_quarter(y.hours) end)
    |> Enum.reduce(0, fn y, acc -> y + acc end)
  end

  defp truncate(nil), do: nil
  defp truncate(number), do: trunc(number)

  # Round a float to the nearest .25
  defp round_to_nearest_quarter(number) when is_float(number) do
    primary =
      number
      |> Float.round(2)
      |> Kernel.*(100)
      |> truncate()

    remainder = if rem(primary, 25) > 12, do: 25, else: 0

    primary
    |> div(25)
    |> Kernel.*(25)
    |> Kernel.+(remainder)
    |> Kernel./(100)
  end

  defp round_to_nearest_quarter(number) when is_integer(number), do: number
end

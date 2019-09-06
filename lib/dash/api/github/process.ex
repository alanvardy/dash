defmodule Dash.Api.Github.Process do
  @moduledoc """
  Processes Github API response to only extract the keys/data that we want
  """
  alias Dash.Api.Github.Issues

  @spec issues(Issues.t()) :: [any]
  def issues(%Issues{response: response}) do
    Enum.map(response, &process_issue/1)
  end

  defp process_issue(issue) do
    %{}
    |> Map.put(:title, title_for(issue))
    |> Map.put(:content, content_for(issue))
    |> Map.put(:url, url_for(issue))
    |> Map.put(:number, number_for(issue))
    |> Map.put(:age, age_for(issue))
    |> Map.put(:repository, repository_for(issue))
    |> Map.put(:repository_url, repository_url_for(issue))
    |> Map.put(:labels, labels_for(issue))
  end

  defp title_for(issue), do: Map.get(issue, "title")
  defp content_for(issue), do: Map.get(issue, "body")
  defp url_for(issue), do: Map.get(issue, "html_url")
  defp number_for(issue), do: Map.get(issue, "number")

  defp age_for(issue) do
    issue
    |> Map.get("updated_at")
    |> length_of_time()
  end

  defp repository_for(issue), do: get_in(issue, ["repository", "name"])
  defp repository_url_for(issue), do: get_in(issue, ["repository", "html_url"])

  defp labels_for(issue) do
    issue
    |> Map.get("labels")
    |> convert_label()
  end

  defp convert_label(labels, result \\ [])
  defp convert_label([], result), do: Enum.reverse(result)

  defp convert_label([%{"color" => color, "name" => name} | tail], result) do
    convert_label(tail, [%{color: color, name: name} | result])
  end

  defp length_of_time(updated_at) do
    past =
      updated_at
      |> Timex.parse("{RFC3339z}")
      |> elem(1)

    case Timex.diff(Timex.now(), past, :seconds) do
      result when result < 60 ->
        "Less than a minute ago"
      1 -> "1 minute ago"
      result when result < 3600 ->
        "#{div(result, 60)} minutes ago"
      result when result < 86_400 ->
        "#{div(result, 3600)} hours ago"
      result ->
        "#{div(result, 86_400)} days ago"
    end
  end
end

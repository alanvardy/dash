defmodule Dash.Github.Issue do
  @moduledoc "An individual issue or pull request from GitHub"
  @keys [
    :title,
    :content,
    :url,
    :number,
    :age,
    :repository,
    :repository_url,
    :labels,
    :pull_request
  ]
  @enforce_keys @keys
  defstruct @keys

  @type t :: %__MODULE__{
          title: String.t(),
          content: String.t(),
          url: String.t(),
          number: non_neg_integer,
          age: non_neg_integer,
          repository: String.t(),
          repository_url: String.t(),
          labels: [map],
          pull_request: boolean
        }

  @spec build([map]) :: [t]
  def build(issues) do
    for issue <- issues do
      %__MODULE__{
        title: title_for(issue),
        content: content_for(issue),
        url: url_for(issue),
        number: number_for(issue),
        age: age_for(issue),
        repository: repository_for(issue),
        repository_url: repository_url_for(issue),
        labels: labels_for(issue),
        pull_request: pull_request_for(issue)
      }
    end
  end

  defp title_for(issue), do: Map.get(issue, "title")
  defp content_for(issue), do: Map.get(issue, "body")
  defp url_for(issue), do: Map.get(issue, "html_url")
  defp number_for(issue), do: Map.get(issue, "number")
  defp repository_for(issue), do: get_in(issue, ["repository", "name"])
  defp repository_url_for(issue), do: get_in(issue, ["repository", "html_url"])

  defp labels_for(issue) do
    issue
    |> Map.get("labels", [])
    |> convert_label()
  end

  defp age_for(issue) do
    issue
    |> Map.get("updated_at")
    |> length_of_time()
  end

  defp pull_request_for(issue) do
    Map.has_key?(issue, "pull_request")
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

    Timex.diff(Timex.now(), past, :seconds)
  end
end

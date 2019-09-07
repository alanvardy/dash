defmodule Dash.Api.Github.Process do
  @moduledoc """
  Processes Github API response to only extract the keys/data that we want
  """
  alias Dash.Accounts.User
  alias Dash.Api.Github.{Issues, Request}

  @spec issues(Issues.t(), User.t()) :: [any]
  def issues(%Issues{response: response}, user) do
    response
    |> Enum.map(fn issue -> process_issue(issue, user) end)
    |> Enum.sort(fn x, y -> x.age <= y.age end)
  end

  defp process_issue(issue, user) do
    %{}
    |> Map.put(:title, title_for(issue))
    |> Map.put(:content, content_for(issue))
    |> Map.put(:url, url_for(issue))
    |> Map.put(:number, number_for(issue))
    |> Map.put(:age, age_for(issue))
    |> Map.put(:repository, repository_for(issue))
    |> Map.put(:repository_url, repository_url_for(issue))
    |> Map.put(:labels, labels_for(issue))
    |> Map.put(:pull_request, pull_request_for(issue))
    |> add_pull_request_data(user)
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

  defp pull_request_for(issue) do
    case Map.get(issue, "pull_request") do
      nil -> nil
      map -> Map.get(map, "url")
    end
  end

  defp add_pull_request_data(%{pull_request: nil} = issue, _user), do: issue

  defp add_pull_request_data(%{pull_request: pull_request} = issue, user) do
    %User{settings: %{github_username: username, github_api_token: token}} = user

    pull_request =
      ~r/https:\/\/api.github.com\/(.+)/
      |> Regex.run(pull_request)
      |> Enum.at(1)
      |> Request.get(username, token)
      |> elem(1)

    state =
      case Map.get(pull_request, "mergeable_state") do
        "blocked" -> "Merge blocked"
        "clean" -> "Ready to merge"
        "unstable" -> "Tests running"
        other -> other
      end

    comments = Map.get(pull_request, "comments")

    issue
    |> Map.put(:comments, comments)
    |> Map.put(:state, state)
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

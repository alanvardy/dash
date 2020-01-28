defmodule Dash.Api.Github.Process do
  @moduledoc """
  Processes Github API response to only extract the keys/data that we want
  """
  alias Dash.Accounts.User
  alias Dash.Api.Github.{Issues, Request}

  @spec issues(Issues.t()) :: {:ok, [map]} | {:error, binary}
  def issues(%Issues{response: nil}) do
    {:error, "No response to process"}
  end

  def issues(%Issues{response: response, user: user}) do
    issues =
      response
      |> Enum.filter(fn issue -> filter_issues(issue, user) end)
      |> Enum.map(fn issue -> process_issue(issue, user) end)
      |> Enum.filter(fn issue -> filter_pull_requests(issue, user) end)
      |> Enum.sort(fn x, y -> x.age >= y.age end)

    {:ok, issues}
  end

  # Keeps the issue if assigned or is a pull request
  defp filter_issues(issue, %User{settings: %{github_username: username}}) do
    assignees =
      issue
      |> Map.get("assignees", [])
      |> Enum.map(fn assignee -> Map.get(assignee, "login") end)

    Enum.member?(assignees, username) || Map.get(issue, "pull_request") != nil
  end

  # We have already filtered non pull requests
  defp filter_pull_requests(%{pull_request: nil}, _user), do: true

  # Select the ones where our review is requested and no review comments yet
  defp filter_pull_requests(issue, %User{settings: %{github_username: username}}) do
    %{
      review_comments: review_comments,
      assignees: assignees,
      requested_reviewers: requested_reviewers
    } = issue

    (Enum.member?(requested_reviewers, username) && review_comments == 0) ||
      Enum.member?(assignees, username)
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
    |> add_status(user)
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
    |> Map.get("labels", [])
    |> convert_label()
  end

  defp pull_request_for(issue) do
    case Map.get(issue, "pull_request") do
      nil -> nil
      map -> Map.get(map, "url")
    end
  end

  defp add_pull_request_data(%{pull_request: nil} = issue, _user), do: issue

  defp add_pull_request_data(%{pull_request: pull_request, age: age} = issue, user) do
    %User{settings: %{github_username: username, github_api_token: token}} = user

    address =
      ~r/https:\/\/api.github.com\/(.+)/
      |> Regex.run(pull_request)
      |> Enum.at(1)

    pull_request =
      case Request.get(address, username, token) do
        {:ok, _header, body} -> body
        {:error, _struct} -> %{}
      end

    state =
      case Map.get(pull_request, "mergeable_state") do
        "blocked" -> "Merge blocked"
        "clean" -> "Ready to merge"
        "unstable" when age > 1200 -> "Failure"
        "unstable" -> "Tests running or failed"
        other -> other
      end

    requested_reviewers =
      pull_request
      |> Map.get("requested_reviewers", [])
      |> Enum.map(fn reviewer -> Map.get(reviewer, "login") end)

    assignees =
      pull_request
      |> Map.get("assignees", [])
      |> Enum.map(fn reviewer -> Map.get(reviewer, "login") end)

    review_comments = Map.get(pull_request, "review_comments")
    comments = Map.get(pull_request, "comments")
    statuses_url = Map.get(pull_request, "statuses_url")

    issue
    |> Map.put(:comments, comments)
    |> Map.put(:state, state)
    |> Map.put(:statuses_url, statuses_url)
    |> Map.put(:review_comments, review_comments)
    |> Map.put(:assignees, assignees)
    |> Map.put(:requested_reviewers, requested_reviewers)
  end

  defp add_status(%{statuses_url: nil} = issue, _user), do: Map.put(issue, :status, nil)

  defp add_status(%{statuses_url: statuses_url} = issue, user) do
    %User{settings: %{github_username: username, github_api_token: token}} = user

    with [_full, matches] <- Regex.run(~r/https:\/\/api.github.com\/(.+)/, statuses_url),
         {:ok, address} <- Enum.fetch(matches, 1),
         {:ok, _header, body} <- Request.get(address, username, token) do
      status =
        case body do
          %{"state" => state} ->
            state

          [%{"state" => state} | _tail] ->
            state

          _ ->
            nil
        end

      Map.put(issue, :status, status)
    else
      _ -> issue
    end
  end

  defp add_status(issue, _user), do: Map.put(issue, :status, nil)

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

defmodule Dash.Api do
  @moduledoc "Logic around APIs"
  alias Dash.Accounts.Settings
  alias Dash.Accounts.User
  alias Dash.Backgrounds.Background
  alias Dash.Api.Harvest
  alias Dash.Api.Time
  alias Dash.Api.Unsplash
  alias Dash.Repo
  import Ecto.Query, warn: false

  @doc "returns a view friendly list of maps"
  def interpret_reports(%User{settings: %Settings{harvest_api_key: nil, harvest_account_id: nil}}),
    do: []

  def interpret_reports(
        %User{settings: %Settings{harvest_api_key: _key, harvest_account_id: _id}} = user
      ) do
    first_step =
      Enum.map(Harvest.projects(user), fn x ->
        x
        |> Map.put(:days_left, Time.days_left())
        |> Map.put(:month, Time.month())
      end)

    second_step =
      Enum.map(first_step, fn x ->
        x
        |> Map.put(:weekdays_left, Time.weekdays_left(x.days_left))
      end)

    Enum.map(second_step, fn x ->
      x
      |> Map.put(:hours_per_day, Time.hours_per_day(x))
    end)
  end

  def interpret_reports(_), do: []
end

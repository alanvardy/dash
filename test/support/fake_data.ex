defmodule Dash.FakeData do
  @moduledoc """
  Fake API data for development testing and Travis CI
  """
  def time_entries do
    [
      %{hours: 1.25, project_id: 12_345, spent_date: "2019-05-22"},
      %{hours: 1.04, project_id: 12_345, spent_date: "2019-05-22"},
      %{hours: 0.23, project_id: 12_345, spent_date: "2019-05-22"},
      %{hours: 2.05, project_id: 4_567, spent_date: "2019-05-22"},
      %{hours: 0.38, project_id: 12_345, spent_date: "2019-05-21"},
      %{hours: 3.37, project_id: 12_345, spent_date: "2019-05-21"},
      %{hours: 1.12, project_id: 6_789, spent_date: "2019-05-21"}
    ]
  end

  def projects do
    [
      %{
        budget: 80,
        client: "Company 1",
        fee: 2000,
        hours: 30,
        id: 12_345
      },
      %{
        budget: 120,
        client: "Company 2",
        fee: 3000,
        hours: 69.5,
        id: 6789
      },
    ]
  end
end

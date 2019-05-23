defmodule DashWeb.FakeData do
  def time_entries do
    [
      %{hours: 1.25, project_id: 21_015_864, spent_date: "2019-05-22"},
      %{hours: 1.04, project_id: 21_015_864, spent_date: "2019-05-22"},
      %{hours: 0.23, project_id: 21_015_864, spent_date: "2019-05-22"},
      %{hours: 2.05, project_id: 21_015_864, spent_date: "2019-05-22"},
      %{hours: 0.38, project_id: 21_015_864, spent_date: "2019-05-21"},
      %{hours: 3.37, project_id: 21_015_864, spent_date: "2019-05-21"},
      %{hours: 1.12, project_id: 21_015_864, spent_date: "2019-05-21"}
    ]
  end

  def projects do
    [
      %{
        budget: 100,
        client: "Code and Effect",
        fee: 6000,
        hours: 69.5,
        id: 21_015_864
      }
    ]
  end
end

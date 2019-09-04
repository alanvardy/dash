defmodule Dash.Api.Harvest.FakeData do
  @moduledoc """
  Fake API data for development testing and Travis CI
  """
  def time do
    Timex.format!(Timex.to_datetime(Timex.now(), "America/Chicago"), "{ISO:Extended:Z}")
  end

  def today do
    {:ok, date} = Timex.format(Timex.today(), "%Y-%m-%d", :strftime)
    date
  end

  def generate(url) do
    case url do
      "/v2/time_entries" ->
        %{
          "links" => %{
            "first" => "https://api.harvestapp.com/v2/time_entries?page=1&per_page=100",
            "last" => "https://api.harvestapp.com/v2/time_entries?page=2&per_page=100",
            "next" => "https://api.harvestapp.com/v2/time_entries?page=2&per_page=100",
            "previous" => nil
          },
          "next_page" => 2,
          "page" => 1,
          "per_page" => 100,
          "previous_page" => nil,
          "time_entries" => [
            %{
              "billable" => true,
              "billable_rate" => nil,
              "budgeted" => true,
              "client" => %{
                "currency" => "CAD",
                "id" => 123_456,
                "name" => "AlanCorp"
              },
              "cost_rate" => 0.0,
              "created_at" => "2019-05-26T18:43:02Z",
              "ended_time" => nil,
              "external_reference" => nil,
              "hours" => 0.49,
              "id" => 1_012_591_877,
              "invoice" => nil,
              "is_billed" => false,
              "is_closed" => false,
              "is_locked" => false,
              "is_running" => false,
              "locked_reason" => nil,
              "notes" => "kjsdb",
              "project" => %{"code" => "12443", "id" => 75_747_372, "name" => "Retainer"},
              "spent_date" => "2019-05-26",
              "started_time" => nil,
              "task" => %{"id" => 12_208_119, "name" => "YEAH"},
              "task_assignment" => %{
                "billable" => true,
                "budget" => nil,
                "created_at" => "2019-05-08T20:43:52Z",
                "hourly_rate" => nil,
                "id" => 227_202_994,
                "is_active" => true,
                "updated_at" => "2019-05-08T20:43:52Z"
              },
              "timer_started_at" => nil,
              "updated_at" => "2019-05-26T19:18:56Z",
              "user" => %{"id" => 9_999_999, "name" => "That Guy"},
              "user_assignment" => %{
                "budget" => nil,
                "created_at" => "2019-05-01T19:06:31Z",
                "hourly_rate" => 80.0,
                "id" => 198_011_405,
                "is_active" => true,
                "is_project_manager" => true,
                "updated_at" => "2019-05-01T19:06:31Z",
                "use_default_rates" => true
              }
            },
            %{
              "billable" => true,
              "billable_rate" => nil,
              "budgeted" => true,
              "client" => %{
                "currency" => "CAD",
                "id" => 123_456,
                "name" => "AlanCorp"
              },
              "cost_rate" => 0.0,
              "created_at" => time(),
              "ended_time" => nil,
              "external_reference" => nil,
              "hours" => 3,
              "id" => 1_012_087_130,
              "invoice" => nil,
              "is_billed" => false,
              "is_closed" => false,
              "is_locked" => false,
              "is_running" => false,
              "locked_reason" => nil,
              "notes" => "dksjfghsdg",
              "project" => %{"code" => "12443", "id" => 75_747_372, "name" => "Retainer"},
              "spent_date" => today(),
              "started_time" => nil,
              "task" => %{"id" => 12_180_683, "name" => "QHER"},
              "task_assignment" => %{
                "billable" => true,
                "budget" => nil,
                "created_at" => "2019-05-03T23:33:58Z",
                "hourly_rate" => nil,
                "id" => 226_704_745,
                "is_active" => true,
                "updated_at" => "2019-05-03T23:33:58Z"
              },
              "timer_started_at" => time(),
              "updated_at" => "2019-05-24T20:49:07Z",
              "user" => %{"id" => 9_999_999, "name" => "That Guy"},
              "user_assignment" => %{
                "budget" => nil,
                "created_at" => "2019-05-01T19:06:31Z",
                "hourly_rate" => 80.0,
                "id" => 198_011_405,
                "is_active" => true,
                "is_project_manager" => true,
                "updated_at" => "2019-05-01T19:06:31Z",
                "use_default_rates" => true
              }
            },
            %{
              "billable" => true,
              "billable_rate" => nil,
              "budgeted" => true,
              "client" => %{
                "currency" => "CAD",
                "id" => 123_456,
                "name" => "AlanCorp"
              },
              "cost_rate" => 0.0,
              "created_at" => "2019-05-24T15:33:21Z",
              "ended_time" => nil,
              "external_reference" => nil,
              "hours" => 0.29,
              "id" => 1_012_066_867,
              "invoice" => nil,
              "is_billed" => false,
              "is_closed" => false,
              "is_locked" => false,
              "is_running" => false,
              "locked_reason" => nil,
              "notes" => "fjbsdkfjgb",
              "project" => %{"code" => "12443", "id" => 75_747_372, "name" => "Retainer"},
              "spent_date" => today(),
              "started_time" => nil,
              "task" => %{"id" => 12_180_684, "name" => "POYB"},
              "task_assignment" => %{
                "billable" => true,
                "budget" => nil,
                "created_at" => "2019-05-03T23:33:58Z",
                "hourly_rate" => nil,
                "id" => 226_704_746,
                "is_active" => true,
                "updated_at" => "2019-05-03T23:33:58Z"
              },
              "timer_started_at" => nil,
              "updated_at" => "2019-05-24T15:50:29Z",
              "user" => %{"id" => 9_999_999, "name" => "That Guy"},
              "user_assignment" => %{
                "budget" => nil,
                "created_at" => time(),
                "hourly_rate" => 80.0,
                "id" => 198_011_405,
                "is_active" => true,
                "is_project_manager" => true,
                "updated_at" => "2019-05-01T19:06:31Z",
                "use_default_rates" => true
              }
            }
          ],
          "total_entries" => 136,
          "total_pages" => 2
        }

      "/v2/projects" ->
        %{
          "links" => %{
            "first" => "https://api.harvestapp.com/v2/projects?page=1&per_page=100",
            "last" => "https://api.harvestapp.com/v2/projects?page=1&per_page=100",
            "next" => nil,
            "previous" => nil
          },
          "next_page" => nil,
          "page" => 1,
          "per_page" => 100,
          "previous_page" => nil,
          "projects" => [
            %{
              "bill_by" => "none",
              "budget" => 100.0,
              "budget_by" => "project",
              "budget_is_monthly" => true,
              "client" => %{
                "currency" => "CAD",
                "id" => 123_456,
                "name" => "AlanCorp"
              },
              "code" => "12443",
              "cost_budget" => nil,
              "cost_budget_include_expenses" => false,
              "created_at" => "2019-05-01T19:06:31Z",
              "ends_on" => nil,
              "fee" => 6.0e3,
              "hourly_rate" => nil,
              "id" => 75_747_372,
              "is_active" => true,
              "is_billable" => true,
              "is_fixed_fee" => true,
              "name" => "Retainer",
              "notes" => "",
              "notify_when_over_budget" => true,
              "over_budget_notification_date" => nil,
              "over_budget_notification_percentage" => 90.0,
              "show_budget_to_all" => false,
              "starts_on" => "2019-05-01",
              "updated_at" => "2019-05-07T20:01:56Z"
            },
            %{
              "bill_by" => "People",
              "budget" => nil,
              "budget_by" => "none",
              "budget_is_monthly" => false,
              "client" => %{
                "currency" => "CAD",
                "id" => 123_456,
                "name" => "AlanCorp"
              },
              "code" => "12442",
              "cost_budget" => nil,
              "cost_budget_include_expenses" => false,
              "created_at" => "2019-04-09T19:54:00Z",
              "ends_on" => nil,
              "fee" => nil,
              "hourly_rate" => nil,
              "id" => 20_793_743,
              "is_active" => false,
              "is_billable" => true,
              "is_fixed_fee" => false,
              "name" => "QHER",
              "notes" => "",
              "notify_when_over_budget" => false,
              "over_budget_notification_date" => nil,
              "over_budget_notification_percentage" => 80.0,
              "show_budget_to_all" => false,
              "starts_on" => nil,
              "updated_at" => "2019-05-06T15:12:18Z"
            }
          ],
          "total_entries" => 8,
          "total_pages" => 1
        }
    end
  end
end

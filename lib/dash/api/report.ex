defmodule Dash.Api.Report do
  @moduledoc "Struct for building Harvest API reports"
  @type t :: %__MODULE__{
          keys: map(),
          projects: [map],
          time_entries: [map],
          time: %{
            days_left: non_neg_integer(),
            month: String.t(),
            weekdays_left: non_neg_integer()
          }
        }
  defstruct keys: nil, projects: nil, time_entries: nil, time: nil
end

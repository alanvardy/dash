defmodule Dash.Api.Harvest.Report do
  @moduledoc "Struct for building Harvest API reports"
  @type t :: %__MODULE__{
          keys: map() | nil,
          projects: [map] | nil,
          time_entries: [map] | nil,
          time:
            %{
              days_left: non_neg_integer(),
              month: String.t(),
              weekdays_left: non_neg_integer()
            }
            | nil
        }
  defstruct keys: nil, projects: nil, time_entries: nil, time: nil
end

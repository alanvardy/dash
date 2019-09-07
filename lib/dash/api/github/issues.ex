defmodule Dash.Api.Github.Issues do
  @moduledoc "Issues and Pull Requests from GitHub"
  @type t :: %__MODULE__{
          response: [map()] | nil,
          processed: [map()] | nil
        }
  defstruct response: [], processed: []
end

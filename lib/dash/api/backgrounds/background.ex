defmodule Dash.Api.Backgrounds.Background do
  @moduledoc "Struct for building Unsplash background image"
  @type t :: %__MODULE__{
          background: map() | nil,
          response: map() | nil,
          needs_update: boolean() | nil,
          user_id: integer()
        }
  defstruct background: nil, response: nil, needs_update: nil, user_id: nil
end

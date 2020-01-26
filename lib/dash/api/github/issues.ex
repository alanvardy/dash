defmodule Dash.Api.Github.Issues do
  @moduledoc "Issues and Pull Requests from GitHub"
  alias Dash.Accounts.User

  @type t :: %__MODULE__{
          response: [map()] | nil,
          processed: [map()] | nil,
          user: nil | User.t()
        }
  defstruct response: [], processed: [], user: nil
end

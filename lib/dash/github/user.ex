defmodule Dash.Github.User do
  use TypedEctoSchema
  @moduledoc "Site user"
  alias Dash.Github.Settings

  typed_schema "users" do
    has_one :settings, Settings, on_delete: :delete_all

    timestamps()
  end
end

defmodule Dash.Harvest.User do
  use TypedEctoSchema
  @moduledoc "Site user"
  alias Dash.Harvest.Settings

  typed_schema "users" do
    has_one :settings, Settings, on_delete: :delete_all

    timestamps()
  end
end

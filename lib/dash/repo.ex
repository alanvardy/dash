defmodule Dash.Repo do
  use Boundary, deps: [], exports: []

  use Ecto.Repo,
    otp_app: :dash,
    adapter: Ecto.Adapters.Postgres
end

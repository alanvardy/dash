# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dash,
  ecto_repos: [Dash.Repo]

# Configures the endpoint
config :dash, DashWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ug+pTncBGNfr5h2//4kMEN3NmNX95sSenT7+LmmaU5Bf5r49UueFmawUbnmbJi/E",
  live_view: [
    signing_salt: "`mix phx.gen.secret 32`"
  ],
  render_errors: [view: DashWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Dash.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
config :canary, repo: Dash.Repo
config :canary, unauthorized_handler: {DashWeb.UserController, :handle_unauthorized}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

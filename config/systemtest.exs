use Mix.Config

# Configure your database
config :dash, Dash.Repo,
  username: "postgres",
  password: "postgres",
  database: "dash_systemtest",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :health, DashWeb.Endpoint,
  http: [port: 5000],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

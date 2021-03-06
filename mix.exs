defmodule Dash.MixProject do
  @moduledoc false
  use Mix.Project

  def project do
    [
      app: :dash,
      version: "0.1.0",
      elixir: "~> 1.10.2",
      elixirc_paths: elixirc_paths(Mix.env()),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:boundary, :phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Dash.Application, []},
      extra_applications: [:logger, :runtime_tools, :timex]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4.16"},
      {:phoenix_pubsub, "~> 1.1"},
      {:phoenix_ecto, "~> 4.0"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.14"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      # json and api
      {:httpoison, "~> 1.4"},
      {:poison, "~> 4.0"},
      {:retry, "~> 0.14.0"},
      {:timex, "~> 3.0"},
      # Auth
      {:comeonin, "~> 5.1"},
      {:pbkdf2_elixir, "~> 1.0"},
      {:bodyguard, "~> 2.4"},
      # Live View
      {:phoenix_live_view, "~> 0.14.0"},
      {:floki, ">= 0.0.0", only: :test},
      # Testing
      {:ex_machina, "~> 2.3", only: :test},
      # ex_check stack
      {:ex_check, ">= 0.0.0", only: :dev, runtime: false},
      {:credo, "~> 1.4.0", only: [:dev, :test], runtime: false},
      {:dialyxir, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:sobelow, "~> 0.8", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.10", only: :test, runtime: false},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:ex_dokku, "~> 0.1.0", only: :dev},
      {:observer_cli, "~> 1.5"},
      {:typed_ecto_schema, "~> 0.1.1"},
      {:boundary, "~> 0.4.0", runtime: false},
      {:stream_data, "~> 0.1", only: [:dev, :test]}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      # for when you get a timeout on `mix deps.get`, just type mix deps
      deps: [&no_parallel/1, &long_timeout/1, "deps.get"],
      alldeps: [&no_parallel/1, &long_timeout/1, "deps.update --all"],
      test: ["ecto.create --quiet", "ecto.migrate", "format", "test"],
      credo: ["credo --strict"],
      "cypress.open": ["cmd ./cypress-open.sh"],
      "cypress.run": ["cmd ./cypress-run.sh"]
    ]
  end

  # To handle dependency timeout issues
  defp no_parallel(_) do
    Mix.shell().info("HEX_HTTP_CONCURRENCY=1")
  end

  defp long_timeout(_) do
    Mix.shell().info("HEX_HTTP_TIMEOUT=120")
  end
end

defmodule Viewy.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer(),
      aliases: aliases(),
      preferred_cli_env: [
        "quality.ci": :test,
        quality: :test
      ]
    ]
  end

  # Dependencies listed here are available only for this
  # project and cannot be accessed from applications inside
  # the apps folder.
  #
  # Run "mix help deps" for examples and options.
  defp deps do
    [
      {:jason, "~> 1.0"},
      {:hackney, "~> 1.9"},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.1", only: [:dev, :test], runtime: false},
      {:mix_audit, "~> 1.0", only: [:dev, :test], runtime: false}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  #
  # Aliases listed here are available only for this project
  # and cannot be accessed from applications inside the apps/ folder.
  defp aliases do
    [
      quality: [
        "format",
        "test",
        "dialyzer",
        "credo --strict",
        "deps.audit"
      ],
      "quality.ci": [
        "format --check-formatted",
        "test --cover",
        "test --raise",
        "credo --strict",
        "dialyzer --plt",
        "deps.audit"
      ],
      # run `mix setup` in all child apps
      setup: ["cmd mix setup"]
    ]
  end

  # DIscrepancy Analyze for ERlang is static analysis tool that identifies
  # software discrepancies, such as definite type errors, code that has
  # become dead or unreachable because of programming error, and unnecessary
  # tests, in single modules or entire (sets of) applications.
  defp dialyzer do
    [
      plt_add_apps: [:mix]
    ]
  end
end

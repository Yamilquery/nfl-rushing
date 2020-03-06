defmodule NflRushing.MixProject do
  use Mix.Project

  def project do
    [
      app: :nfl_rushing,
      version: "0.1.0",
      elixir: "~> 1.10.2",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {NflRushing.Application, []}
    ]
  end

  defp deps do
    [
      {:cors_plug, "~> 2.0"},
      {:cowboy, "~> 2.4"},
      {:jason, "~> 1.1"},
      {:plug_cowboy, "~> 2.0"},
    ]
  end
end

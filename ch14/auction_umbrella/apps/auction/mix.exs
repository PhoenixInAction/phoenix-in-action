defmodule Auction.MixProject do
  use Mix.Project

  def project do
    [
      app: :auction,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Auction.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "3.0.3"},
      {:postgrex, "0.14.1"},
      {:comeonin, "~> 4.1"},
      {:pbkdf2_elixir, "~> 0.12"}
    ]
  end

  defp aliases do
    [test: ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end

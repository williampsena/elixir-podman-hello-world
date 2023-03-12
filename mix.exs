defmodule Fruit.MixProject do
  use Mix.Project

  def project do
    [
      app: :fruit,
      version: "0.0.1",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies
  defp deps do
    [
      {:plug_cowboy, "~> 2.5"}
    ]
  end
end

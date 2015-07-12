defmodule Opbeat.Mixfile do
  use Mix.Project

  def project do
    [app: :opbeat,
     version: "0.2.1",
     elixir: "~> 1.0",
     description: "Elixir client for opbeat",
     deps: deps(Mix.env)]
  end

  def application do
    [applications: [:logger, :httpoison]]
  end

  defp deps(:development), do: deps
  defp deps(:test) do
    [{ :espec, "~> 0.6.3"}] ++ deps
  end
  defp deps(_), do: deps

  defp deps do
    [
      {:httpoison, "~> 0.6.2"},
      {:poison, "~> 1.3.1"}
    ]
  end
end

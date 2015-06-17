defmodule Opbeat.Mixfile do
  use Mix.Project

  def project do
    [app: :opbeat,
     version: "0.2.1",
     elixir: "~> 1.0",
     description: "Elixir client for opbeat",
     package: package,
     deps: deps(Mix.env)]
  end

  def application do
    [applications: [:logger, :httpoison]]
  end

  defp deps(:development), do: deps
  defp deps(:test) do
    [{ :amrita, "~> 0.4", github: "josephwilk/amrita", only: :test }] ++ deps
  end
  defp deps(_), do: deps

  defp package do
    [
     files: ["lib", "mix.exs", "README.md", "test*", "config"],
     contributors: ["Teodor Pripoae"],
     deps: deps(_),
     links: %{
         "GitHub" => "https://github.com/teodor-pripoae/opbeat",
     }
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 0.6.2"},
      {:poison, "~> 1.3.1"}
    ]
  end
end

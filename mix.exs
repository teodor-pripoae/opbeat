defmodule Opbeat.Mixfile do
  use Mix.Project

  def project do
    [app: :opbeat,
     version: "0.3.0",
     elixir: "~> 1.1",
     description: "Elixir client for opbeat",
     package: package,
     deps: deps(Mix.env)]
  end

  def application do
    [applications: [:logger, :httpoison]]
  end

  defp package do
    [
     files: ["lib", "mix.exs", "README.md", "test*", "config"],
     maintainers: ["Teodor Pripoae"],
     deps: deps,
     licenses: ["MIT"],
     links: %{
         "GitHub" => "https://github.com/teodor-pripoae/opbeat",
     }
    ]
  end

  defp deps(:development), do: deps
  defp deps(:test) do
    [{ :espec, "~> 0.6.3"}] ++ deps
  end
  defp deps(_), do: deps

  defp deps do
    [
      {:httpoison, "~> 0.8.0"},
      {:poison, "~> 1.5.0"}
    ]
  end
end

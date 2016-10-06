defmodule Opbeat.Mixfile do
  use Mix.Project

  def project do
    [app: :opbeat,
     version: "0.3.0",
     elixir: "~> 1.3.2",
     description: "Elixir client for opbeat",
     package: package,
     preferred_cli_env: [espec: :test],
     deps: deps]
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

  defp deps do
    [
      {:espec, "~> 1.1.0", only: :test},
      {:httpoison, "~> 0.9.1"},
      {:poison, "~> 2.2.0"}
    ]
  end
end

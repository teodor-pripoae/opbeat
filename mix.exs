defmodule Opbeat.Mixfile do
  use Mix.Project

  def project do
    [app: :opbeat,
     version: "0.4.1",
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
     files: ["lib", "mix.exs", "README.md", "spec*", "config"],
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
      {:espec, "~> 1.3.2", only: :test},
      {:httpoison, "~> 0.11.1"},
      {:poison, "~> 3.1.0"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end

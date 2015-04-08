defmodule Opbeat.Version do
  def version do
    Mix.Project.config[:version]
  end

  def full_version do
    "opbeat-elixir/#{Opbeat.Version.version}"
  end
end

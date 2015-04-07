defmodule Opbeat.Config do
  def auth do
    Application.get_env(:opbeat, :auth)
  end

  def enabled do
    Application.get_env(:opbeat, :enabled) || false
  end
end

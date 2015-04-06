defmodule Opbeat.Config do
  def auth do
    Application.get_env(:opbeat, :auth)
  end
end

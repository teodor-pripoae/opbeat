defmodule Opbeat.HostInfo do
  def misc do
    misc(%{})
  end

  def misc(opts) do
    opts |> Map.put(:host, Opbeat.HostInfo.get_full_hostname)
         |> Map.put(:client_version, Opbeat.Version.full_version)
  end

  def extra do
    extra(%{})
  end

  def extra(opts) do
    opts |> Map.put(:elixir, Opbeat.HostInfo.get_elixir_version)
         |> Map.put(:erlang, Opbeat.HostInfo.get_erlang_version)
  end

  def get_elixir_version do
    System.version
  end

  def get_erlang_version do
    :erlang.system_info(:otp_release) |> List.to_string
  end

  def get_full_hostname do
    :net_adm.localhost |> List.to_string
  end
end

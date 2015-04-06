defmodule Opbeat.Client do
  use HTTPoison.Base

  def process_url(url) do
    base_url
  end

  def base_url do
    config = Opbeat.Config.auth
    "https://opbeat.com/api/v1/organizations/#{config.org_id}/apps/#{config.app_id}/errors/"
  end

  def process_request_headers(headers) do
    get_default_headers(Opbeat.Config.auth)
  end

  def report(_e) do
    data = %{message: "SyntaxError: Some other error!"}
        |> Map.put(:misc, Opbeat.HostInfo.misc)
        |> Map.put(:extra, Opbeat.HostInfo.extra)

    do_request(data)
  end

  def do_request(data) do
    config = Opbeat.Config.auth
    url = get_url(config)
    headers = get_default_headers(config)
    json_data = Poison.encode!(data, %{})

    HTTPoison.request(:post, url, json_data, headers)
  end

  defp get_url(config) do
    "https://opbeat.com/api/v1/organizations/#{config.org_id}/apps/#{config.app_id}/errors/"
  end

  defp get_default_headers(config) do
    #config = Opbeat.Config.auth
    [
      {"User-Agent", Opbeat.Version.full_version},
      {"Authorization", "Bearer #{config.app_secret}"},
      {"Content-Type", "application/json"}
    ]
  end
end

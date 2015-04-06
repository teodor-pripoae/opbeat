defmodule Opbeat.Client do
  def report(e, misc) do
    report(e, misc, %{})
  end

  def report(e) do
    report(e, %{}, %{})
  end

  def report(e, misc, extra) do
    data = %{message: Opbeat.ErrorFormatter.format_message(e), \
             stacktrace: Opbeat.ErrorFormatter.format_stacktrace(e), \
             misc: Opbeat.HostInfo.misc(misc), \
             extra: Opbeat.HostInfo.extra(extra)}

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
    [
      {"User-Agent", Opbeat.Version.full_version},
      {"Authorization", "Bearer #{config.app_secret}"},
      {"Content-Type", "application/json"}
    ]
  end
end

defmodule Opbeat.Client do
  use HTTPoison.Base

  def process_url(url) do

  end

  def base_url do
    config = Opbeat.Config.get_config
    "https://opbeat.com/api/v1/organizations/#{config.org_id}/apps/#{config.app_id}/errors/"
  end
end

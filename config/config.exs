# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :opbeat, :auth,
  %{org_id: System.get_env("OPBEAT_ORG_ID"), \
    app_id: System.get_env("OPBEAT_APP_ID"), \
    app_secret: System.get_env("OPBEAT_APP_SECRET")}

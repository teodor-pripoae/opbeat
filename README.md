Opbeat
======

Elixir client for [Opbeat](https://opbeat.com).

##Installation

Add module to `mix.exs`

```elixir
def deps do
  [{:opbeat, github: "teodor-pripoae/opbeat"}]
end
```

Add following settings to `config.exs`

```elixir
config :opbeat, :auth,
  %{org_id: System.get_env("OPBEAT_ORG_ID"), \
    app_id: System.get_env("OPBEAT_APP_ID"), \
    app_secret: System.get_env("OPBEAT_APP_SECRET")}
```

By default Opbeat logging is disabled. You must enabled it for `production.exs` or `staging.exs`

```elixir
config :opbeat, :enabled, true
```

##Usage

To report and error:

```elixir
if Opbeat.Client.enabled do
  Opbeat.Client.report(e)
end
```

You can also pass options `misc` and `extra` as `Map`:

```
Opbeat.Client.report(e, %{mymisc: "Some Value"}, %{myextra: "aaaa"})
```

##TODO

- [ ] add support for http connection info
- [ ] more tests with [VCR](https://github.com/parroty/exvcr)
- [ ] show more stacktrace information so it can be formatted properly on opbeat
- [ ] make requests with [HTTPoison.AsyncResponse](https://github.com/edgurgel/httpoison#async-requests)
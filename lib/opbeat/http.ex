defmodule Opbeat.HTTP do
  def format_http(plug_conn) do
    %{url: format_url(plug_conn), \
      method: format_method(plug_conn), \
      data: format_data(plug_conn), \
      query_string: format_qs(plug_conn), \
      cookies: format_cookies(plug_conn), \
      headers: format_headers(plug_conn), \
      remote_host: format_remote_host(plug_conn), \
      http_host: format_http_host(plug_conn), \
      user_agent: format_user_agent(plug_conn), \
      secure: format_secure(plug_conn)
    }
  end

  def format_url(plug_conn) do
    scheme = plug_conn.scheme
    if plug_conn.port == 80 do
      host = plug_conn.host
    else
      host = "#{plug_conn.host}:#{plug_conn.port}"
    end

    path = plug_conn.path_info |> Enum.join("/")

    "#{scheme}://#{host}/#{path}"
  end

  def format_method(plug_conn) do
    plug_conn.method
  end

  def format_data(plug_conn) do
    plug_conn.params
  end

  def format_qs(plug_conn) do
    plug_conn.query_string
  end

  def format_cookies(plug_conn) do
    plug_conn |> Plug.Conn.get_req_header("cookie") |> Enum.join(";")
  end

  def format_headers(plug_conn) do
    Enum.into(plug_conn.req_headers, %{})
  end

  def format_remote_host(plug_conn) do
    case plug_conn.peer do
      {host, port} ->
        host |> Tuple.to_list |> Enum.join(".")
      _ ->
        ""
    end
  end

  def format_http_host(plug_conn) do
    plug_conn |> Plug.Conn.get_req_header("host") |> Enum.join(";")
  end

  def format_user_agent(plug_conn) do
    plug_conn |> Plug.Conn.get_req_header("user-agent") |> Enum.join(";")
  end

  def format_secure(plug_conn) do
    plug_conn.scheme == :https
  end
end

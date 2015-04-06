defmodule Opbeat.HostInfoTest do
  use Amrita.Sweet

  describe "get_elixir_version" do
    it "should return 1.0.2" do
      assert Opbeat.HostInfo.get_elixir_version == "1.0.2"
    end
  end

  describe "get_erlang_version" do
    it "should return 17" do
      assert Opbeat.HostInfo.get_erlang_version == "17"
    end
  end

  describe "extra" do
    it "should return elixir/erlang" do
      extra = Opbeat.HostInfo.extra

      assert extra == %{erlang: "17", elixir: "1.0.2"}
    end

    it "should return merged args" do
      extra = Opbeat.HostInfo.extra(%{"My-Setting": "123"})
      assert extra == %{erlang: "17", elixir: "1.0.2", "My-Setting": "123"}
    end
  end

  describe "misc" do
    it "should return erlang hostname" do
      provided [Opbeat.HostInfo.get_full_hostname |> "my.host.name"] do
        misc = Opbeat.HostInfo.misc
        assert misc == %{host: "my.host.name", client_version: "opbeat-elixir/#{Opbeat.Version.version}"}
      end
    end

    it "should add misc data" do
      provided [Opbeat.HostInfo.get_full_hostname |> "my.host.name"] do
        misc = Opbeat.HostInfo.misc(%{"My-Other": "value", testing: "true"})
        assert misc == %{host: "my.host.name", \
                         client_version: "opbeat-elixir/#{Opbeat.Version.version}", \
                         "My-Other": "value", \
                         testing: "true"}
      end
    end
  end
end

defmodule Opbeat.HostInfoTest do
  use ESpec

  describe "get_elixir_version" do
    it "should return 1.0.2" do
      expect(Opbeat.HostInfo.get_elixir_version).to eql(System.version)
    end
  end

  describe "get_erlang_version" do
    it "should return 19" do
      expect(Opbeat.HostInfo.get_erlang_version).to eql("19")
    end
  end

  describe "extra" do
    it "should return elixir/erlang" do
      extra = Opbeat.HostInfo.extra

      expect(extra).to eql(%{erlang: "19", elixir: System.version})
    end

    it "should return merged args" do
      extra = Opbeat.HostInfo.extra(%{"My-Setting": "123"})
      expect(extra).to eql(%{erlang: "19", elixir: System.version, "My-Setting": "123"})
    end
  end

  describe "misc" do
    it "should return erlang hostname" do
      allow(Opbeat.HostInfo).to accept(:get_full_hostname, fn -> "my.host.name" end)

      misc = Opbeat.HostInfo.misc
      expect(misc).to eql(%{host: "my.host.name", client_version: "opbeat-elixir/#{Opbeat.Version.version}"})
    end

    it "should add misc data" do
      allow(Opbeat.HostInfo).to accept(:get_full_hostname, fn -> "my.host.name" end)
      misc = Opbeat.HostInfo.misc(%{"My-Other": "value", testing: "true"})
      expect(misc).to eql(%{host: "my.host.name", \
                            client_version: "opbeat-elixir/#{Opbeat.Version.version}", \
                            "My-Other": "value", \
                            testing: "true"})
    end
  end
end

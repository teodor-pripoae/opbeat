if System.get_env("MIX_ENV") != "test" do
  IO.puts("Please manually set MIX_ENV=test")
  Kernel.exit(:normal)
end

ESpec.start

ESpec.configure fn(config) ->
end

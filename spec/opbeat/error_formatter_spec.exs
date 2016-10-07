defmodule Opbeat.ErrorFormatterTest do
  use ESpec

  describe "format_messgae" do
    it "returns correct values for undefined function" do
      try do
        MissingMethod.crash
      rescue
        exception ->
          expect(Opbeat.ErrorFormatter.format_message(exception)).to eql("function MissingMethod.crash/0 is undefined (module MissingMethod is not available)")
      end
    end
  end

  describe "format_stacktrace" do
    it "returns correct values for error" do
      try do
        CrashingMethod.crash
      rescue
        exception ->

          st = Opbeat.ErrorFormatter.format_stacktrace(exception)
          frames = st.frames

          expect(frames).to_not eql(nil)
          expect(length(frames)).to eql(7)

          expect(Enum.at(frames, 0)).to eql(%{filename: "lib/espec/runner.ex", function: "do_run", lineno: 51})
          expect(Enum.at(frames, 1)).to eql(%{filename: "lib/espec/runner.ex", function: "run_examples", lineno: 81})
          expect(Enum.at(frames, 2)).to eql(%{filename: "lib/enum.ex", function: "-map/2-lists^map/1-0-", lineno: 1184})
          expect(Enum.at(frames, 3)).to eql(%{filename: "lib/enum.ex", function: "-map/2-lists^map/1-0-", lineno: 1184})
          expect(Enum.at(frames, 4)).to eql(%{filename: "lib/espec/example_runner.ex", function: "run_example", lineno: 39})
          expect(Enum.at(frames, 5)).to eql(%{filename: "lib/espec/example_runner.ex", function: "try_run", lineno: 67})
          # expected = [
          #   %{filename: "test/opbeat/error_formatter_spec.exs", function: "test format_stacktrace - returns correct values for error", lineno: 18},
          #   %{filename: "lib/ex_unit/runner.ex", function: "exec_test", lineno: 249},
          #   %{filename: "timer.erl", function: "tc", lineno: 165},
          #   %{filename: "lib/ex_unit/runner.ex", function: "-spawn_test/3-fun-1-", lineno: 199}]
          # expect(Opbeat.ErrorFormatter.format_stacktrace(exception)).to eql(%{frames: expected})
      end
    end
  end
end

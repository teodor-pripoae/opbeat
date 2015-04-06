defmodule Opbeat.ErrorFormatterTest do
  use Amrita.Sweet

  describe "format_messgae" do
    it "returns correct values for undefined function" do
      try do
        MissingMethod.crash
      rescue
        exception ->
          assert Opbeat.ErrorFormatter.format_message(exception) == "undefined function: MissingMethod.crash/0 (module MissingMethod is not available)"
      end
    end
  end

  describe "format_stacktrace" do
    it "returns correct values for error" do
      try do
        CrashingMethod.crash
      rescue
        exception ->
          expected = [
            %{filename: "test/opbeat/error_formatter_test.exs", function: "test format_stacktrace - returns correct values for error", lineno: 18},
            %{filename: "lib/ex_unit/runner.ex", function: "exec_test", lineno: 249},
            %{filename: "timer.erl", function: "tc", lineno: 165},
            %{filename: "lib/ex_unit/runner.ex", function: "-spawn_test/3-fun-1-", lineno: 199}]
          assert Opbeat.ErrorFormatter.format_stacktrace(exception) == expected
      end
    end
  end
end

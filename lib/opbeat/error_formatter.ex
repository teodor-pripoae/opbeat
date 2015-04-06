defmodule Opbeat.ErrorFormatter do
  def format_message(e) do
    Exception.message(e)
  end

  def format_stacktrace(e) do
    raw_st = Enum.map System.stacktrace, fn(line) ->
      {_module, method, _index, file_info} = line

      {filename, lineno} = get_file_and_line(file_info)

      if filename do
        %{function: method, \
          filename: filename, \
          lineno: lineno}
      else
        nil
      end
    end

    # Strip lines without file/lineno
    Enum.reject raw_st, fn(x) ->
      x == nil
    end
  end

  def get_file_and_line(file_info) do
    filename = Keyword.get(file_info, :file)
    lineno = Keyword.get(file_info, :line)
    {filename, lineno}
  end
end

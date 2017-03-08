defmodule Opbeat.ErrorFormatter do
  def format_message(e) do
    Exception.message(e)
  end

  def format_stacktrace(_e) do
    raw_st = Enum.map System.stacktrace, fn(line) ->
      {_module, method, _index, file_info} = line

      {filename, lineno} = get_file_and_line(file_info)

      if filename do
        %{function: Atom.to_string(method), \
          filename: List.to_string(filename), \
          lineno: lineno}
      else
        nil
      end
    end

    # Strip lines without file/lineno
    valid_st = Enum.reject raw_st, fn(x) ->
      x == nil
    end

    # reverse stacktrace since Opbeat is expecting it in cronological order
    %{frames: valid_st |> Enum.reverse}
  end

  def get_file_and_line(file_info) do
    filename = Keyword.get(file_info, :file)
    lineno = Keyword.get(file_info, :line)
    {filename, lineno}
  end
end

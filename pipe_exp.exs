# Pipe operator experiments
defmodule Piper do
  def pipe_start(param1, param2) do
    pipe_to_function(param1, param2)
  end

  @doc """
  Pipe the value of param1 through
  1. an anonymous function and then
  2. callback to itself
  """
  def pipe_to_function(param1, param2) when param1 < param2 do
    IO.inspect param1 # This should show that a is incrementing with each function call

    # Pipe through operator always passes the param as the first parameter to the
    # next function in perspective. This means when pipe_to_function(param2) is called,
    # it is actually interpreted as:
    # pipe_to_function(<value_piped_through>, param2),
    # where <value_piped_through> is the incoming value
    param1 |> (fn(param1) -> param1 + 1 end).() |> pipe_to_function(param2)

    # It could also have been achieved as:
    # increment(param1) |> pipe_to_function(param2)
  end

  def pipe_to_function(param1, param2) when param1 >= param2 do
    IO.puts "This is hit ..........."
    IO.inspect %{param1: param1, param2: param2}
  end

  def increment(num) do
    num + 1
  end

end

Piper.pipe_start(2,5)

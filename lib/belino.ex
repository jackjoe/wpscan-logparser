defmodule Belino do
  @moduledoc """
  Documentation for Belino.
  """

  @spec parse(binary) :: list
  def parse(str) do
    {:ok, tokens, _} = str |> to_charlist() |> :wpscan_lexer.string()
    # IO.inspect(tokens)
    {:ok, list} = :wpscan_parser.parse(tokens)
    IO.inspect(list)
    # Enum.each(list, fn item -> IO.puts("[#{item.type}] #{item.text}") end)
    list
  end
end

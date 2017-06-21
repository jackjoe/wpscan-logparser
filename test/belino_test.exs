defmodule BelinoTest do
  use ExUnit.Case
  doctest Belino

  test "parses a test log" do
    log = File.read!(Path.expand("./test/fixtures/full_log.txt"))
    Belino.parse(log)
  end
end

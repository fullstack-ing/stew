defmodule StewTest do
  use ExUnit.Case
  doctest Stew

  test "greets the world" do
    assert Stew.hello() == :world
  end
end

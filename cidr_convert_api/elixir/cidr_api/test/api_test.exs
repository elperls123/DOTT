defmodule CidrApiTest do
  use ExUnit.Case
  doctest CidrApi

  test "greets the world" do
    assert CidrApi.hello() == :world
  end
end

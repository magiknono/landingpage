defmodule LandingpageTest do
  use ExUnit.Case
  doctest Landingpage

  test "greets the world" do
    assert Landingpage.hello() == :world
  end
end

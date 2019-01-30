defmodule DomainDrivenTest do
  use ExUnit.Case
  doctest DomainDriven

  test "greets the world" do
    assert DomainDriven.hello() == :world
  end
end

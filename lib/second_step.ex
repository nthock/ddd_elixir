defmodule SecondStep do
  def generate(args) do
    args
    |> do_something()
  end

  defp do_something(args) do
    IO.inspect("this is second step")
    args
  end
end

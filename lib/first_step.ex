defmodule FirstStep do
  def generate(args) do
    args
    |> do_something()
  end

  defp do_something(args) do
    args
  end
end

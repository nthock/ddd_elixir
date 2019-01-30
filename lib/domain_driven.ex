defmodule DomainDriven do
  def call(module, method, args, opts \\ %{}) do
    result = apply(module, method, args)
    if Map.has_key?(opts, :after), do: do_call(opts.after, result)
  end

  defp do_call({module, method}, args) do
    apply(module, method, [args])
  end
end

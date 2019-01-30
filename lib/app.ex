defmodule App do
  def start do
    import Supervisor.Spec

    children = [
      worker(Broadcaster, []),
      worker(Consumer, [1], id: 1),
      worker(Consumer, [0], id: 2)
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end

defmodule Consumer do
  use GenStage

  def start_link(params) do
    GenStage.start_link(__MODULE__, {:ok, params})
  end

  ## Callbacks
  def init({:ok, params}) do
    # Selector: only subscribe to certain id - depending on the params passed in
    {:consumer, :ok,
     subscribe_to: [{Broadcaster, selector: fn {_event, %{id: id}} -> rem(id, 2) == params end}]}
  end

  def handle_events(events, _from, state) do
    for event <- events do
      IO.inspect({self(), event})
    end

    {:noreply, [], state}
  end
end

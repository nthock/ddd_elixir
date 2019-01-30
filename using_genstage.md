A dispatcher that accumulates demand from all consumers before broadcasting events to all of them.

If a producer uses GenStage.BroadcastDispatcher, its subscribers can specify an optional `:selector` function that receives the event and returns a boolean in the subscription options.

Assume producer and consumer are stages exchanging events of type `%{:key => String.t, any => any}`, then by calling

```elixir
GenStage.sync_subscribe(consumer,
  to: producer,
  selector: fn %{key: key} -> String.starts_with?(key, "foo-") end)
```

consumer will receive only the events broadcast from producer for which the selector function returns a truthy value.

The `:selector` option can be specified in sync and async subscriptions, as well as in the `:subscribe_to` list in the return tuple of `GenStage.init/1`. For example:

```elixir
def init(:ok) do
  {:consumer, :ok, subscribe_to:
    [{producer, selector: fn %{key: key} -> String.starts_with?(key, "foo-") end}]}
end
```

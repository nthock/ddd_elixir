# DomainDriven (WIP)

Example of Domain-Driven Design in Elixir

## Using GenStage

The current setup will spawn 1 producer, and 2 consumers. Each consumer will subscribe to different type of event. 1 consumer will only subscribe to event with odd `id` and the other will subscribe to event with event `id`. This is a simple demonstration of how to distribute load to 2 different consumers.

To test out using GenStage, boot up the project using `iex -S mix`.

```
iex> App.start()
iex> Broadcaster.sync_notify({:member_paid, %{id: 1, amount: 5_000}}) # Emitting event with data
iex> Broadcaster.sync_notify({:member_paid, %{id: 2, amount: 5_000}}) # Emit another event with different ID
```

Running the first `Broadcaster.sync_notify/2` will return a different `pid` as the second `Broadcaster.sync_notify/2`.

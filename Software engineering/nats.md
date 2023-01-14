# Nats

# Jetstream 

## Async
Jetstream has a mode that publishes messages asynchronously .

Using this async publishing is very simple . 

You just have to call `PublishAsync` instead of `Publish` .

Also you need to configure the publish_async_max_pending while creating a NatsConn object . 

The `publish_async_max_pending` represents the max number of requests that client sends to cmq asynchronously before getting the PubAck . 
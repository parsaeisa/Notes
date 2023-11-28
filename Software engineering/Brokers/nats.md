# Nats

There are three products related to NATS discussed in this document:
- [nats core](https://github.com/parsaeisa/Notes/blob/main/Software%20engineering/Brokers/nats.md#nats---core)
- [nats streaming](https://github.com/parsaeisa/Notes/blob/main/Software%20engineering/Brokers/nats.md#streaming)
- [jetstream](https://github.com/parsaeisa/Notes/blob/main/Software%20engineering/Brokers/nats.md#jetstream)

# Nats - core

Nats has trade-off:
- It can handle high traffic with low resources,
- But it has message loss. 

Nats core is a **fire and forget databus** so it doesn't persist messages. 

The **Streaming** requires a persistence on data. Nats-streaming unlikely to nats-core supports this features.

In nats core no ack is returned.

## Closing a nats conn

When the app is shutting down some garbage collection operations should be done. 

- closing the connection
- Unsubscribing all of subscriptions 

For a connection the closing process is essentially:

- Drain all subscriptions
- Stop new messages from being published
- Flush any remaining published messages
- Close

But when these operations halt sending the messages that are published and pending ( for example stucked in a buffer ).

### Drain

With using `Drain` method in nats, those messages are still going to be published for the old clients.

The drain method is used instead of `close` method.

The mechanics of drain for a subscription are simpler:
- Unsubscribe
- Process all cached or inflight messages
- Clean up


# Streaming
In traditional way a message was published and recieved by a consumer and if the consumer needed it for the second time, The message would be republished . That causes some overhead on the publisher .

Streaming is a more persistant way to exchange messages . A persistant storage stores the message for the consumer to not sending it more than one time .

The nats core doesn't persist the data. But nats-streaming does.
Nats streaming enables duplex streaming it has four kinds .

But Nats streaming needed a refactor and it got a hard process, hence they released jet-sreaming, which is better than jet-streaming in many ways.

# Jetstream 

Before we use any stream in nats, we should create an streaming with the nats connection using the code below : 
```go
js, _ := NatsConn.JetStream()

// Create a stream
js.AddStream(&nats.StreamConfig{
    Name:     "FOO",
    Subjects: []string{"ride.accepted"},
    MaxBytes: 1024,
})
```

We define subjects and other parameters while adding streams. 

And don't forget to defer closing the stream .
```go
defer js.DeleteStream("FOO")
```

## Async
Jetstream has a mode that publishes messages asynchronously .

Using this async publishing is very simple . 

You just have to call `PublishAsync` instead of `Publish` .

Also you need to configure the publish_async_max_pending while creating a NatsConn object . 

The `publish_async_max_pending` represents the max number of requests that client sends to cmq asynchronously before getting the PubAck . 

## Ack 
Ack is one of the configurable parameters in connection between the client and the broker.

When we publish something we need an acknowledge. 
But in some cases we don't.

When we publish a message on nats (core) , it returns no ack to us.

JetStream is a layer on nats core which sends ack when we publish on it.

There some kinds of Acks in nats . 

`AckAll` It returns an Ack for each 100 requests for example . One for the request index 100 and the ack for other 99 requests are ignored . It reduces the ack overhead . 

`AckExplicit` It returns ack for each request . 

`AckNone` It returns no ack .


## Commands

```bash
export NATS_URL
```

listing consumers: 
``` bash
nats consumer ls 
```

Removing a consumer is just like removing a file from a directory.
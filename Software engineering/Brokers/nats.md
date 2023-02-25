# Nats

# Streaming
In traditional way a message was published and recieved by a consumer and if the consumer needed it for the second time, The message would be republished . That causes some overhead on the publisher .

Streaming is a more persistant way to exchange messages . A persistant storage stores the message for the consumer to not sending it more than one time .

Nats streaming enables duplex streaming it has four kinds .

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

There some kinds of Acks in nats . 

`AckAll` It returns an Ack for each 100 requests for example . One for the request index 100 and the ack for other 99 requests are ignored . It reduces the ack overhead . 

`AckExplicit` It returns ack for each request . 

`AckNone` It returns no ack .
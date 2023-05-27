# Rabbit

I think rabbit has more functionalities than other mentioned brokers.

Rabbit is considered as **delayed queue**.

It can store **jobs**.

## Features
These features distinguish Rabbit mq from other message brokers.

### Various messaging pattern
It supports various messaging patterns : 
* publish/subscribe
* request/reply
* point-to-point communication

### Multiple message protocols
It supports multiple messaging protocols:
* Advanced Message Queuing Protocol (AMQP)
* Message Queuing Telemetry Transport (MQTT)
* Streaming Text Oriented Messaging Protocol (STOMP)

### Data persistance

It stores data to the this, so if the server goes down, it ensures that messages are not lost. providing reliability and fault-tolerant message delivery. 

### Routing and exchange types 

It uses exchanges to route messages to queues. 

It provides various exchange types: 
* direct
* topic
* fanout
* headers

### Acknowledgement
Consumers sends Acknowledgemnts when they recieve a message.

### Scalability

Multiple RabbitMQ nodes can work together as a single logical broker. 

This provides:
* scalability
* fault-tolerance
* high availability for handling increased message throughput
* ensuring system resilience

### Plugins 

It Offers plugins that extend it's funcionality.


## Exchange

Exchange need to be made seperatedly like topics.

Messages are always published to an exchange and then that exchange decides where to forward it.

Creating exchanges with golang:
```go
exchangeName := "myExchange"
exchangeType := "direct"

err = ch.ExchangeDeclare(
    exchangeName, // Name of the exchange
    exchangeType, // Type of the exchange (e.g., direct, fanout, topic)
    false,        // Durable - exchange survives broker restart
    false,        // Auto-deleted - exchange is deleted when there are no bindings
    false,        // Internal - only used for exchange-to-exchange bindings
    false,        // No-wait - don't wait for a response
    nil,          // Arguments
)
if err != nil {
    log.Fatal(err)
}
```

Each publish method takes an exchange as input to publish messages to.

## Consuming

For consuming in golang: 
```go
msgs, err := ch.Consume(
    queueName, // Queue name to consume from
    "",        // Consumer tag - unique identifier for the consumer
    true,      // Auto-acknowledge - messages are automatically acknowledged
    false,     // Exclusive - this consumer gets exclusive access to the queue
    false,     // No-local - don't deliver messages published by this connection
    false,     // No-wait - don't wait for a response
    nil,       // Arguments
)
if err != nil {
    log.Fatal(err)
}

// Start a goroutine to handle incoming messages
go func() {
    for msg := range msgs {
        // Process the received message
        log.Printf("Received message: %s", msg.Body)
    }
}()

// Block the main goroutine to keep the consumer alive
select {}

```

As you can see we should create a new goroutine to consume on a queue.

## Job schedule 

Jobs can be scheduled in Rabbit.

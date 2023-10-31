# Rabbit

I think rabbit has more functionalities than other mentioned brokers.

Rabbit is considered as **delayed queue**. It can store an event for a configurable time, then publish it after that delay time. 

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

### Acknowledgement
Consumers sends Acknowledgemnts when they recieve a message. Rabbit uses TCP protocol.

### Scalability

Multiple RabbitMQ nodes can work together as a single logical broker. 

This provides:
* scalability
* fault-tolerance
* high availability for handling increased message throughput
* ensuring system resilience

### Plugins 

It Offers plugins that extend it's funcionality.


## Structure 

Components that are monitored: 
- Nodes
- Queued messages
- incoming messages
- Outgoing messages
- Queues
- Channels
- Connections

### Exchange

Exchange need to be made seperatedly like topics.

Messages are always published to an exchange and then that exchange decides which message queue bind it to.

* **Binding** sits between exchanges and message queues.

Each publish method takes an exchange as input to publish messages to.

When Rabbit MQ is started, a default exchange is being created. 

### Routing and exchange types 

It uses exchanges to route messages to queues. 

It provides various exchange types: 
* Direct
* Topic
* Fanout
* Headers

### Binding 

As mentioned earlier, bingind sits between exchanges and queues.

Bindings have a binding key (or called routing key) 

## Job schedule 

Jobs can be scheduled in Rabbit.

## Retry pattern

The `ReChannel` method is a method that is executed in a new goroutine when Dialing RabbitMQ from project.

```go
func (r *RabbitMQ) ReChannel() {
	for {
		reason, ok := <-r.channel.NotifyClose(make(chan *amqp.Error))
		if !ok {
			break
		}

		r.Logger.Error("rabbitmq channel closed", zap.Error(reason))

		connection := r.connectionWithRetry()
		if connection == nil {
			r.Logger.Fatal("rabbitmq re-connection failed")
		}

		r.Logger.Info("reconnection successed")

		r.connection = connection

		channel := r.channelWithRetry()
		if channel == nil {
			r.Logger.Fatal("rabbitmq re-channel creation failed")
		}

		r.Logger.Info("channel recreated")

		r.channel = channel
	}
}
```


## Networking

Your client (your program) creates a connection to RabbitMQ server. 

Using this connection, your client can create multiple **channels**. These channels can be used concurrently. Two TCP packets are required for creating a channel.

**While publishing** we must set exchange name and payload. The client publishes messages to exchanges. 

## Management console


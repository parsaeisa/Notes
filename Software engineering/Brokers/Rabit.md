# Rabit

I think rabbit has more functionalities than other mentioned brokers.

Rabbit is considered as **delayed queue**.

It can store **jobs**.

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


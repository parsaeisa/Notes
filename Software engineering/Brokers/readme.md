# Brokers

Event processing is different processing paradigm than request driven. 

Based on [Desining distributed systems](https://github.com/parsaeisa/Notes/blob/main/Software%20engineering/Architecture/Distributed%20Systems.md) book.The main difference is it's isolation. A requests in an application is among other requests and is a part of a user's session. But event processing are single stance tasks.

My own important factor is the fact that event processing can be used to more time consuming tasks.

Topics:
- [Nats]()
- [Kafka]()
- [RabbitMQ]()

Brokers are a way for communicating between microservices. A third party server that takes the responsibility of recieveing and publishing ( and in some cases storing ) the messages . 

I think all of them use MQTT protocol . 

* MQTT protocol is so neat in IoT .

Famous brokers : 
* Kafka
* Rabbit mq
* MQTT
* Nats ( and nats streaming and jetstream and etc)

## points

* Brokers sometimes publish a message more than one time. This can be critical in financial applications for example. For example if a service is penalizing in an application triggered by recieving an event, sending the event more than one time can make the penalization more than one time bigger. 

This is configurable in many brokers to publish it **exactly one time** or **at least one time**.

## Message exchanging patterns

> This section's resource is Nats documentation, I don't know whether these patterns exist in other brokers or not. 

The traditional way is the scenario that consumers gets data when they are published and if they were not connected to the broker, they don't get the message.

## Real time processing

There are so much use cases that a large amount of data need to be processed real-time. 

There are some tools and some concepts which are used. 

**OLAP**: OLAP is a concept and an approach to analyzing large amount data sets. This is optimized for query-heavy operations. It is implemented by:
- Microsoft SQL Server Analysis Services (SSAS)
- Oracle OLAP
- SAP BW
- Apache Pinot ( used by Uber )
- Apache Flink ( used by Uber )

# Brokers

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
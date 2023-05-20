# Microservices architecture

I guess the most important advantage of microservice architecture is reducing the interactions between different teams . 

Technical teams offenly have conflicts and interactions between them can waste so much time.

The more number of services talk to each other , the higher goes the latency . 

Microservices architecture is against Monolith architecture . 

## Problems of Monolith architecture 

* The stack of all features should be the same . 
* The needed version of that stack must be the same in all of features , because they are in same app . 
* While testing and deploying (CI\CD) , we need to test and deploy the whole app . 
* While scaling we need to scale whole application . 

One of the best ways to break down the application into multiple services is **business purposes** . s

## Communcation between services

* Serving on one port ( http , graphql, grpc and etc)
* Message broker : like Rabbit MQ and Nats .
* SDKs , the destination service gives a sdk to the origin service .
* Service Mesh which is something in k8s .

## Best-practices 

- All services must have a same project template, Which makes it easier for developers to read and start working on new services. 

## Api-gateway 

All requests to the app, pass through the api-gateway. They are going to a single element and that point sends requests to their corresponding micro-service. This element is called api-gateway. 

An `nginx` is installed on api-gateway which will proxy-pass the requests to the right microservice.

As I recall, **proxy** was a way to hide clients identity from server, the **reverse proxy** Is a way to hide server's identity from clients. 

Here reverse proxy is usefull because client should not know that a specific response was send from which service, So they pass through a load-balancer (nginx).

## Downsides of Micro Service

* Configuring the connection between services . 
* Bug findings and monitoring is so much harder because we don't know where is the problem . 

Tools are being developed to tackle this challenges of micro services like security , messaging , orchestration , containers and monitoring . one of the most famous tools is **K8s** . 

## Repository 
There are 2 ways to store projects code in github or gitlab repos . 
* Poly Repo
* Mono Repo

### Poly Repo
One seperated repo for each service . 

Advantages : 
* A seperated pipeline for each service . no extra logic is needed . 

Disadvantages : 
* Searching for a word and debugging is more difficult . 
* Sharing resources is more difficult . 

> **Repositories grouping** is one of the features of **gitlab** . 

We can group repositories of our **project** in to one group in gitlab .

### Mono Repo
Create one repo for all of services , and seperate them with folders (one folder for each service)

## Patterns : 

### Api-Gateway

### Circuit breakers 

### Command Query Responsibility Segregation

### Retry pattern

It handles service failures automatically.

It retries a service call in certain number of times. 

### Event-driven pattern

### Service registry pattern

### Sidecar pattern

### Bulkhead pattern

### Saga pattern

### Outbox pattern

### Self-containment pattern

### External configuration pattern

### Strangler pattern

## Some existing problems

* data partitioning and data replication
* service governance and service lifecycle management
* How will you make sure that your Microservices is not affecting other Microservices in the same host?
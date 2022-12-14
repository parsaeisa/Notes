# Microservices architecture

The more number of services talk to each other , the higher goes the latency . 

Microservices architecture is against Monolith architecture . 

## Problems of Monolith architecture 

* The stack of all features should be the same . 
* The needed version of that stack must be the same in all of features , because they are in same app . 
* While testing and deploying (CI\CD) , we need to test and deploy the whole app . 
* While scaling we need to scale whole application . 

One of the best ways to break down the application into multiple services is **business purposes** . s

## Communcation between services

* Http requests
* Message broker : like Rabbit MQ and Nats .
* Service Mesh which is something in k8s .
* gRPC

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

## Mono Repo
Create one repo for all of services , and seperate them with folders (one folder for each service)
# Kubernetes

## Manifests

##  What it has : 
* service account : which is a fake account 
* api server 
* Headless services
* Node exporter - which has metrics

## Job 

You can define a job for k8s that is executed in a cron job timing . 

grpc load balancing : 
* kube resolver 
* connection pool

grpc just sends a single TCP connection and handles every thing in it . like redis pipe . 

In this document I want to talk about what to do exactly with k8s.
## Deploy
We talk to k8s within manifests. 
We adjust specifications in manifests 

## Main concepts
You can see main concepts of k8s in the k8s dashboard : 

{image of dashboard}

## Levels 
Pod is the atomicity of kubernetes . 

Pod → Deployments → Projects

Each of these are k8s clusters . we can get the list of them in cli using : 

```bash
get <resource name>s
```

## Statefulsets

Stateful sets are used for stateful components of our system . 

Components like databases, key-value stores , brokers etc.

For example postgre , mariadb , redis, nats, kafka etc. 

## Configmaps

I don’t know the difference between configmaps and deployment configs . 

A service in k8s reads configuration variables from a config file that is  stored in the k8s itself. 

This is useful when an incident is happening and we want to configure the connections or behavior of system very quickly. Without the need of ( is need correct here?? ) changing the project in source code ( creating branches and merge requests and shit )

## Secrets  

In our configmaps, we may need to store some passwords . e.g. the username and password for connection to a database . 
These passwords should not be shown in the configmaps . so we store them in secrets to be available merely for administrators.  

## HPA 
It stands for Horizontal pod autoscaler . 

We can create it using the k8s dashboard . 

## Networking 

Networking is one of the sections in okd dashboard ( administrator mode ) . 

{image}

### Routes
We can define routes for connecting to a deployment . We can define only for ourselves and for debugging purposes.


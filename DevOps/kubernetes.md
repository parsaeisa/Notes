# Kubernetes

Kubernetes or k8s is container orchestration tool.

In this document I want to talk about what to do exactly with k8s.

K8s and almost all other container orchestrator use a linux kernel feature called **CFS**. 
CFS handles resource allocations and enforce limits for runing containers.



## Service account 

This is an account that is used for pipelines in automations.

It has a level of access that can be for example editor.

grpc load balancing : 
* kube resolver 
* connection pool

grpc just sends a single TCP connection and handles every thing in it . like redis pipe . 

To learn : 
- CRD
- What is exactly a cluster ??

Files: 
- clusterrolebinding.yaml
- configmap.yaml
- deployment.yaml
- ingress.yaml
- networkpolicy.yaml
- pvc.yaml
- serviceaccount.yaml
- service.yaml

You can create most of these files using `helm create` command. 

## Manifests

Each object is defined for k8s in a yml file that I like to call manifest. 

It has a structure : 
```
apiVersion: 
kind:
metadata:
    [e.g. names & labels]
spec:
    [other key featues of object]
```

##  What it has : 
* service account : which is a fake account 
* api server 
* Headless services
* Node exporter - which has metricss

## Job 

You can define a job for k8s that is executed in a cron job timing . 

### Using k8s job in a project

You can put an endpoint in your project that has a handler. In this handler you do things that you want to be done on in a scheduled way on a regular basis.

Then in that cronjob, you can make a request to that endpoint ( in bash, curl ) in time regulations that you want.

## Deploy
We talk to k8s within manifests. 
We adjust specifications in manifests 

## Main concepts
You can see main concepts of k8s in the k8s dashboard : 

<img src="https://github.com/parsaeisa/Notes/blob/main/DevOps/okd-dashboard.png" width="200" height="650" >

## Levels 
Pod is the atomicity of kubernetes . 

Pod → Deployments → Projects

Each of these are k8s clusters. we can get the list of them in cli using : 

```bash
get <resource name>s
```

## Service 

Service is an abstraction layer over pods. You can access pods through their assigned service. 

I has some key points :

- Stable ip address : Pods' ip addresses change contantly, but a service's ip address & DNS name is constat all the time and other connections can be made to it. 

- Load balancing

- Headless services: K8s supports headless services which returns the IP address of a pod, then then other services can **directly** interact with that pod. 

- Service Types: 

- Service discovery


### Selector 

Selector is the main component of service. 

It is used to identify the set of Pods that the Service should target.

Selector works with labels. If a selector has a set of labels A, it **selects** pods with A labels.

### Other components of service

Other components configures service's behaviour & **connectivity**.

- Cluster IP : used for interacting inside the cluster. 
- Port, Endpoint
- ServiceType
- Service discovery 
- External access

## Statefulsets

Stateful sets are used for stateful components of our system . 

Components like databases, key-value stores , brokers etc.

For example postgre , mariadb , redis, nats, kafka etc. 

## Configmaps

Configmaps are subset of __volumes__.

I don’t know the difference between configmaps and deployment configs . 

A service in k8s reads configuration variables from a config file that is  stored in the k8s itself. 

This is useful when an incident is happening and we want to configure the connections or behavior of system very quickly. Without the need of ( is need correct here?? ) changing the project in source code ( creating branches and merge requests and shit )

### Secrets  

In our configmaps, we may need to store some passwords . e.g. the username and password for connection to a database . 
These passwords should not be shown in the configmaps . so we store them in secrets to be available merely for administrators.  

## HPA 
It stands for Horizontal pod autoscaler . 

We can create it using the k8s dashboard . 

HPA has three parameters :
- min : the minimum count of our pods 
- max : the maximum counts 
- cpu-percent : This is one of the metrics that k8s decides to scale pods with.

Autoscaling using HPA with CLI : 
```bash
oc autoscale deployment/helloworld --min=2 --max=10 --cpu-percent=240
```

## Networking 

Networking is one of the sections in okd dashboard ( administrator mode ) . 

{image}

### Routes
We can define routes for connecting to a deployment . We can define only for ourselves and for debugging purposes.

## Volumes

A volume can be created within a project and can be used by pods within that project. Volumes **cannot be shared between projects**, and if a project is deleted, the pods and the volumes within that project will be deleted.

About block storage volumes: 
- Block storage volumes can only be attached to one pod at a time.
- An application that will use a block storage volume has to change for having more reliability and failover.

First you create a volume, then you add it to a Deployment. You can add storage to a Deployment within this way : 

Administrator > Workloads > Deployments > your application > Actions > Add Storage

After adding the storage, a new deployment is being created. Now go to your pod's terminal and run `df -h` to see the free storage in the volume.

Also you can **detach** a volume from your deployment, simply by removing it in Administrator > Workloads > Deployments > your application > Configuration tab.

Volumes can be deleted. 

## Cluster role binding

## Operator


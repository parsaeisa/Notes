# Kubernetes

Kubernetes or k8s is container orchestration tool.

In this document I want to talk about what to do exactly with k8s.

K8s and almost all other container orchestrator use a linux kernel feature called **CFS**. 
CFS handles resource allocations and enforce limits for runing containers.


## Main concepts
You can see main concepts of k8s in the k8s dashboard : 

<img src="https://github.com/parsaeisa/Notes/blob/main/DevOps/okd-dashboard.png" width="200" height="650" >

You can get the information of an object using `describe` commands. 
```bash
oc describe [object type] [object type]
```

For example:
```bash
oc describe project automation-test
```

### Level of abstraction 
Pod is the atomicity of kubernetes . 

Pod → Deployments → namespace → TEAM

* in openshift instead of **namespace** we have **project**.

Each of these are k8s clusters. we can get the list of them in cli using : 

```bash
get <resource name>s
```

###  To learn : 
* service account : which is a fake account 
* api server 
* Headless services
* Node exporter - which has metricss
* Kustomization

## Manifests

Each object is defined for k8s in a yml file that I like to call manifest. Manifests are descriptive files.

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

It has a structure : 
```
apiVersion: 
kind:
metadata:
    [e.g. names & labels]
spec:
    [other key featues of object]
```

We talk to k8s within manifests. I use **helm** for deploying applications. You can read about helm [here](https://github.com/parsaeisa/Notes/blob/main/DevOps/Helm.md)

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

### Labels

Labels are assigned to each object in k8s for querying purposes. With labels we can select objects with desired properties. 

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

For example postgre , mariadb , redis, nats, kafka, prometheus, etcd, etc. 

Replication of databases has some points that are mentioned [here](https://github.com/parsaeisa/Notes/tree/main/Software%20engineering/Database#highly-availability)

StatefulSets require **human operations**. But this facts denies many of k8s main concepts like : 
* automation
* less human intervention
* self healing

So here we need an alternative. Those alternatives suppose to be **operators**.

Kubernetes has **fully automated manner** while manging stateless apps but the concept of operators is defined using StatefulSets. This is because k8s doesn't have required knowledge for managing them.

* stateless apps doesn't have business logic (??)

### Operator

Operator is a software operator instead of human operator.

Operators should do this in a automated manner : 
- deploy the app
- create clusters of APIs
- recover

Operators has a loop : 

<img src="https://github.com/parsaeisa/Notes/blob/main/DevOps/operator_loop.png" width="400" height="250">

Operators can be **custom operators** in  k8s. 

It also watches for changes, changes in configurations such as image's URL.

It uses CRDs which stands for **C**ustom **R**esource **D**efinitions.

Resources are what I called objects in previous. We have resources such as configMaps, deplymetns etc. We can define our custom resources using CRDs. This is just basic understanding of CRDs I explained about it more in CRD section.

* Operators for many applications has been developed already by the community and you can access them using : operatorhub.io

There is also an **operator sdk** that helps to create an operators.

### CRD's

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

## Clusters

Each cluster contains nodes

## Controllers

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

One example of using volumes in deployments is creating shared files. First you define a volume in your deployment:

```bash
apiVersion: apps/v1
kind: Deployment
spec:
    templates:
        spec:
            volumes:
                - name: shared-file
                  emptyDir: {}
```

Then you add this to one of containers in your deployment: 

```bash
apiVersion: apps/v1
kind: Deployment
spec:
    templates:
        spec:
            containers:
                - name: exampleContainer
                  image: exampleImage
                  volumeMounts:
                    - name: shared-file # The name of volume that your shared files are placed in
                      mountPath: /path/in/container/
                      subPath: /path/in/shared volume/
            volumes:
                - name: shared-file
                  emptyDir: {}
```


### Configmaps

Configmaps are subset of __volumes__.

I don’t know the difference between configmaps and deployment configs . 

A service in k8s reads configuration variables from a config file that is  stored in the k8s itself. 

This is useful when an incident is happening and we want to configure the connections or behavior of system very quickly. Without the need of ( is need correct here?? ) changing the project in source code ( creating branches and merge requests and shit )

#### Adding a config to a project

When you want to run your application with a config file, your default path for config file is probably the root directory. 

In configMaps, the data section, you can define multiple files : 

```bash
data:
    config1.yml: |-
        # configurations
    config2.yml: |-
        # configurations
    config3.yml: |-
        # configurations
```

Then a volume is created in your pod host machine. You can add this volume to your deployment in this way (it's just like mounting a volume with some little differences ) : 

```bash
apiVersion: apps/v1
kind: Deployment
spec:
    templates:
        spec:
            volumes:
                - name: config
                    configMap:
                    name: "app-name"
```

For adding a config file to a container in your deployment do this:

```bash
apiVersion: apps/v1
kind: Deployment
spec:
    templates:
        spec:
            containers:
                - name: exampleContainer
                  image: exampleImage
                  volumeMounts:
                    - name: config # The name of volume that your configMap is placed in
                      mountPath: /path/in/container/
                      subPath: /path/in/config volume/
            volumes:
                - name: config
                    configMap:
                    name: "app-name"
```


#### Secrets  

In our configmaps, we may need to store some passwords . e.g. the username and password for connection to a database . 
These passwords should not be shown in the configmaps . so we store them in secrets to be available merely for administrators.  

## Cluster role binding

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


## Job 

You can define a job for k8s that is executed in a cron job timing . 

### Using k8s job in a project

You can put an endpoint in your project that has a handler. In this handler you do things that you want to be done on in a scheduled way on a regular basis.

Then in that cronjob, you can make a request to that endpoint ( in bash, curl ) in time regulations that you want.

## Team

Each team consists multiple namespaces. 

A namespace can be a part of a team to get quota more than usual. 

Namespaces can be joined to teams and being removed from it. 

## Deamonset

Deamonset is used when we want to add a process to every cluster in kubernetes.

## Role

There are some actions defined on k8s objects. Like reading, editing, etc.

A user or a pod ( e.g. deamonset pod ) can get some of these accesses.

I think due to deamonset mindset, it needs to modify some pods and need some accesses. 
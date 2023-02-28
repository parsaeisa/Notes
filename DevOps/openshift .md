# OpenShift

`-f` is always for opening a file . 

`oc rollout` deploys something . 

`oc apply` applies a configmap to a resource

`oc process` Process a template into list of resources

For logging in to our account we must copy the login command from oc dashboard . 

`oc port-forward` forwards requests from a specific pod to one of your local machine's ports . 

`oc get pods` shows deployed pods' names . 

`oc rsh [pod name]` makes an ssh remote shell to specified container . 

## Yaml files

It has a kind, and value for that kind can be:
* Deployment
* Template
* ConfigMap
* CronJob
* HorizontalPodAutoscaler
* Ingress
* Service
* ServiceMonitor
* ServiceAccount

### Deployment 
a simple deployment yaml file is shown here :
```helm
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-openshift
spec:
  replicas: 1
  selector:
    matchLabels:
      app: hello-openshift
  template:
    metadata:
      labels:
        app: hello-openshift
    spec:
      containers:
        - name: hello-openshift
          image: openshift/hello-openshift:latest
          ports:
            - containerPort: 80
```
You can create a deployment by using this command : 
```bash
oc create -f <path to the deloyment yml file>
```

delte a deployment :
```bash
oc delete deployment <deployment name>
```

# Helm

To create a new helm chart execute the below command :
```bash
helm create <chart name>
```

This commands generates some yaml files called "objects" that describes our application .

Helm chart is used to describe our app when deloying on k8s .


this needs a seperate file , move these notes to another file . 

## Commands

### Install
The install command is normally used to deploy the projects.

At first we should validate our chart : 
```go
helm install --dry-run --debug ./mychart
```
The debug inspects the generated definitions.

After checking the validation of helm chart we can deploy it using the below command : 
```go
helm install myapplication ./mychart 
```

## Lint
```bash
helm lint ./mychart
```
The `./mychart` is the directory that has our objects.

## Package 
If you want to share you charts : 
```bash
helm package ./mychart
```

## don't know what 
```bash
helm dependency update <path>
```

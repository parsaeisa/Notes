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

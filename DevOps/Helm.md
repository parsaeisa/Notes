# Helm

To create a new helm chart execute the below command :
```bash
helm create <chart name>
```

This commands generates some yaml files called "objects" that describes our application .

Helm chart is used to describe our app when deloying on k8s .


this needs a seperate file , move these notes to another file . 

## Syntax 

If you have a set of objects in your value like this :
```
services:
    service1:
        url: "foo"
    service2: 
        url: "bar"
```

You can iterate through these using `range`:

```
{{- range $name, $val := .Values.services}}
// other helm operations 
{{- end}}
```

### default 

In an equation in helm, the `default` assign a default_value to variable if the corresponding value is nil or is not set. 

```
{{- $name := default .Values.name "John Doe" }}
```

In this code block,`$name` is equal to `.Values.name`, but if `.Values.name` was nil, `$name` will be equal to "John Dde".

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

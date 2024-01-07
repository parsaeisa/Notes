# Helm

Helm is a command line tool for interacting with helm charts. Helm charts is one of approaches for deploying a service on k8s & openshift.

To create a new helm chart execute the below command :
```bash
helm create <chart name>
```

This commands generates some yaml files called "objects" that describes our application .

Helm chart is used to describe our app when deloying on k8s .


this needs a seperate file , move these notes to another file . 

## To learn
* dependency

## Syntax 

When you are defining objects for k8s or openshift ( is helm inegretable for k8s or not ??) there gonna be lots of duplicated codes. Using helm syntax you can remove these duplications. 

### seperator 

Helm descriptions are written in yaml files. 

With using `---` (dash dash dash) we can put definitions of **multiple** objects in a **single** file and seperate them. 

### range
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

### printf
It's something like fmt.printft in golang. 

```
{{ printf FORMAT_STRING ARGUMENTS... }}
```

### include 

```
{{ include KEY_IN_OTHER_OBJECTS .}}
```

you can define a template in `_helpers.tpl` file like this for an object's labels : 
```helm
{{- define "appName.labels" -}}
helm.sh/chart: {{ include "appName.chart" . }}
{{ include "appName.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
```

Then in the manifest of that object for labels you can do this: 
```
metadata: 
    labels: {{ include "appName.labels" . }}
```

Then all of your defined labels will come here. 

## Commands

### Install
The install command is normally used to deploy the projects.

At first we should validate our chart : 
```go
helm install --dry-run --debug <path to chart>
```
The debug inspects the generated definitions.

After checking the validation of helm chart we can deploy it using the below command : 
```go
helm install myapplication <path to chart>
```

### Uninstall 

I think when you want to re-deploy a resource, you should uninstall it first. 

If you delete the deployment you still gonna have issues and get this error : 

> Error: INSTALLATION FAILED: cannot re-use a name that is still in use

with the command below you can delete a name from kubernetes:
```bash
helm uninstall <app name>
```

### Upgrade

Use this command if you already installed an app and you want to update it.

```bash
helm upgrade [name] [path to chart directory]
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

## Dependency

Dependencies are other helm charts that a helm chart relies on to function properly. 
```bash
helm dependency update <path>
```

The path in the command above is the path to template. The dependencies must be listed on `Chart.yaml` file in the `dependencies` section. 

```
dependencies:
    - name:
      version:
      repository:
```

## bitnami 

bitnami is a very powerful tool (??) that helps you run open source softwares on any platform, such kuber, various cloud environments or even local systems. 

bitnami is used to provide charts for dependencies list. 

The link below is the repository for helm charts in bitnami I guess:

https://charts.bitnami.com/bitnami

This can be added by helm using this command:
```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
```

> Check bitnami anytime you were not busy. It seems cool. 

### Foot of koozeh gari

When you have multiple dependencies, they should be updated to their latest version. If they are not, their **bitnami/common** (which I don't know that it is) can cause conflicts and `common.labels.standard` won't be executed.  
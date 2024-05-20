# Managing Kubernetes

A good link which I started reading about this concept there: https://kubernetes.io/docs/concepts/cluster-administration/

## Networking 

Source: https://kubernetes.io/docs/concepts/cluster-administration/networking/

There are 4 network problem in K8s: 
- Container to container connection: Containers are inside Pods so their connection are handled with localhost.
- Pod to pod connection: 
- Pod to service connection
- External to service connection

Last two items are covered by **Services**.

https://medium.com/google-cloud/understanding-kubernetes-networking-pods-7117dd28727


# Scaling

## Best practices 



## Auto-scaling 

K8s handles highly-availability in a great level. For autoscaling we use k8s. 

Put at least 2 pods for a service to HA that service. But if the requests to our service is going to grow we need to add more pods.

* Before any scaling we need load-testing and fine-tuning to see whether the service works as we expected or not.


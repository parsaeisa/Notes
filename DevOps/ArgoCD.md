# ArgoCD 

K8s doesn't understand **git**. Anytime you update an image you need to inform k8s manually. 

But argoCD reads configs from a git repository, shows it's changes from the up & running mode automatically.

It also shows the health check of pods while re-creating.
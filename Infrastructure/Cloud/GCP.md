# GCP

## Google Kubenetes Engine (GKE)

Seems like managing kubernetes has 5 items:
- Setting up infra, servers, etc. 
- Installung k8s
- Setting up control plane and worker nodes
- Configuring worker nodes (Type, scaling)
- Workloads

The first 3 items are always handled by GCP. The GKE has two modes:
* Standard mode: Customer can manage only the last **two items**
* Autopilot mode: Customr can manage only the last **item**

### Differences between Autopilot and Standard mode

The key cost factor: In standard, you pay for the whole node, but in autopilot, you pay just for CPU/memory requests. 

### Why standard?

Having full-access is usefull for some bunch of scenarios:
- Installing custom agents on nodes. Where SSH access to nodes is needed.
- Using Spot VMs
- Running Hybrid clusters 

Idk what are the things mentiond above, read them later.
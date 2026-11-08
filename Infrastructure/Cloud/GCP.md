# GCP

To learn:
- Different processer series (C4, C4A, N4, C3, C3D, T2A, T2D, ...)
- A software engineer should always **have sense** about sizes & capacities.

## Regional vs Zonal

In regional architecture, resources are automatically distributed and **replicated** across **multiple Availability Zones** (typically 3) within a single region (e.g., `us-central1`).

We know basics like how are availability and cost in both of these architectures.

| Criterion | Zonal Architecture | Regional Architecture |
| :--- | :--- | :--- |
| **Network Latency** | **Lower.** Data traffic stays strictly within the same physical data center, minimizing inter-service latency. | **Slightly Higher.** Synchronous data replication and inter-pod traffic across zones introduce slight network latency. |
| **Use Cases** | Development/Testing environments, non-critical workloads, batch processing, latency-sensitive single-node apps. | Production environments, mission-critical applications, enterprise databases requiring high uptime SLAs. |

Well, the Regional mode obviously seems a better option, when we have **sensitive data** or a **payment service** or when **downtime is very bad for us**. But in what cases we use Zonal mode? Some of them are listed here:
* **Ephemeral Staging & Dev Environments:**
  * **Scenario:** A feature branch environment spun up by a CI/CD pipeline for PR testing.
  * **Why Zonal:** If zone `us-central1-a` experiences an outage, developers can re-deploy to another zone or wait out the downtime. High availability is unnecessary, and running multi-zone nodes for short-lived testing wastes budget.

* **Batch Processing & Data Crunching (Stateless / Re-runnable):**
  * **Scenario:** Overnight video transcoding jobs, machine learning model training (e.g., PyTorch on GPUs), or daily financial report generation.
  * **Why Zonal:** The workloads can be restarted from checkpoints if a zone fails. Placing GPU/TPU worker nodes in a single zone avoids cross-zone latency and avoids high data-transfer egress costs during massive network reads.

* **Low-Latency In-Memory Caching (Single-Node Redis / Memcached):**
  * **Scenario:** A transient session-store or L1 cache where microsecond response times are critical and data loss is tolerable because it can be rebuilt from the primary DB.
  * **Why Zonal:** Eliminates the ~1–2ms network latency added by cross-zone synchronous replication.

## Google Kubenetes Engine (GKE)

- What is release channel?

Seems like managing kubernetes has 5 items:
- Setting up infra, servers, etc. 
- Installung k8s
- Setting up control plane and worker nodes
- Configuring worker nodes (Type, scaling)
- Workloads

The first 3 items are always handled by GCP. The GKE has two modes:
* Standard mode: Customer can manage only the last **two items**
* Autopilot mode: Customr can manage only the last **item**

In Workload tab you see all Kubernetes resources which run pods.

### Differences between Autopilot and Standard mode

The key cost factor: In standard, you pay for the whole node, but in autopilot, you pay just for CPU/memory requests. 

#### Why standard?

Having full-access is usefull for some bunch of scenarios:
- Installing custom agents on nodes. Where SSH access to nodes is needed.
- Using Spot VMs
- Running Hybrid clusters 

Idk what are the things mentiond above, read them later.

### Cloud shell

For interacting with clusters, we get the credentials for the cluster from `gcloud` command, then inside that cluster we run for example `kubectl expose ...`.

We can **simply copy** the "get credential" command from the clusters pannel in GKE.
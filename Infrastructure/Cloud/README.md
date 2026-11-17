# Cloud

## Architectural Layer Comparison: GCP vs. Private Cloud

| Architectural Layer | Google Cloud Platform (GCP) | Private Cloud (e.g., Internal Cloud) | Core Responsibility |
| --- | --- | --- | --- |
| **Container Orchestration** | **GKE** (Google Kubernetes Engine) | **Kubernetes** (via Kubespray, Rancher, or Cluster API) | Schedules, scales, and manages containerized applications. |
| **Compute & Networking (IaaS)** | **Compute Engine (VMs)** & **VPC** | **OpenStack** (Nova, Neutron, Octavia) | Provisions virtual machines, virtual networks, and load balancers. |
| **Distributed Storage** | **Cloud Storage** & **Persistent Disk** | **Ceph** (RBD, RGW, CephFS) | Aggregates raw disks into block, object, and file storage pools. |
| **Physical Infrastructure** | Google Data Centers & Proprietary Hardware | **Bare Metal Servers** (On-Premises Data Centers) | Provides raw compute, memory, storage drives, and physical switches. |

---

### Core Infrastructure Components Explained

* **OpenStack:** An open-source cloud operating system that pools compute, storage, and networking resources across a data center. It abstracts physical hardware into on-demand **Virtual Machines (Nova)**, software-defined **Networks (Neutron)**, and **Load Balancers (Octavia)** managed via APIs, replicating the core IaaS capabilities of AWS EC2 or GCP Compute Engine.
* **Ceph:** A fault-tolerant, distributed storage platform designed to scale horizontally on commodity hardware without a single point of failure. It unifies local disks across multiple servers into a single storage cluster, simultaneously exposing **Block Storage** (for Kubernetes Persistent Volumes), **Object Storage** (S3-compatible APIs), and **File Systems**.

## Main duties of a Cloud Engineer

### 1. Infrastructure Architecture & Automation

* **Goal:** Build, automate, and continuously deploy reliable cloud systems.
* **Key Tasks:** Provision cloud resources (servers, databases, networks) using Infrastructure as Code (e.g., Terraform), implement auto-scaling and load balancing for high availability, and build CI/CD pipelines for seamless deployments.

### 2. Cloud Security & Governance

* **Goal:** Protect cloud assets and ensure compliance with security standards.
* **Key Tasks:** Design isolated Virtual Private Clouds (VPCs), configure firewalls, manage Identity & Access Management (IAM), and keep sensitive databases securely hidden from the public internet.

### 3. Monitoring & Cost Optimization

* **Goal:** Ensure system health, maintain uptime, and control cloud expenditure.
* **Key Tasks:** Set up monitoring and alerting tools (e.g., Prometheus, CloudWatch) to resolve issues proactively, and right-size or terminate unused cloud resources to optimize costs.
# Platform

It makes the Cloud accessible to Programmers. 

## Some sources

- platformengineering.org
- KodeKloud

### A simple recommended roadmap
By Gemini. I think very **RAW**.

**Step 1: Core Concepts & Platform Fundamentals (1 Week)**
* **Goal:** Master the core philosophy of Platform Engineering, Internal Developer Platforms (IDPs), Developer Experience (DevEx), and "Platform as a Product."
* **Key Focus:** Study the free resources on `platformengineering.org` or complete the **Platform Engineering Certified Practitioner (PECP)** material.


**Step 2: Developer Portal & Service Catalog Layer (2 Weeks)**
* **Goal:** Learn how to build self-service portals and abstracts infrastructure complexity for developers.
* **Key Focus:** Master **Backstage** (by Spotify) on **KodeKloud** or **Udemy** to construct developer portals, service catalogs, and self-service templates.

**Step 3: Continuous Delivery & GitOps Layer (2 Weeks)**
* **Goal:** Automate software delivery pipelines using Git as the single source of truth for infrastructure and applications.
* **Key Focus:** Complete **ArgoCD (GitOps)** and **Kubernetes Advanced** courses on **KodeKloud** or **Udemy**.

**Step 4: Infrastructure Provisioning & Cloud Extension Layer (2 Weeks)**
* **Goal:** Provision cloud infrastructure programmatically and manage cloud resources natively inside Kubernetes.
* **Key Focus:** Learn **Terraform** (Infrastructure as Code) and **Crossplane** (Kubernetes Control Plane extension) via **KodeKloud** or dedicated online labs.

## Some key Platform Engineering Considerations

**Security & Secrets Management (Least Privilege):** Enforce strict IAM roles so the control plane (e.g., Crossplane) has minimal cloud permissions. Ensure generated credentials and connection secrets are automatically injected into secure vaults (e.g., HashiCorp Vault or Kubernetes Secrets), never exposed in Git or plain text.

**Network Isolation & Safeguards:** Automate VPC/subnet placement and security group rules so resources (e.g., databases) are strictly private without public IP exposure.

**Governance & Cost Control (FinOps):** Set guardrails and resource quotas (e.g., maximum instance sizes or storage limits) to prevent over-spending. Implement automatic cleanup/TTL policies for non-production environments.

**Reliability & Environment Drift:** Enforce multi-AZ deployment and automated backups for Production by default, while spinning up cost-effective, single-instance resources for Dev/Test environments.

**Automated Day-2 Operations (Observability):** Ensure every auto-provisioned resource automatically connects to central monitoring tools (e.g., Prometheus/Grafana) for metrics and logging without manual setup.
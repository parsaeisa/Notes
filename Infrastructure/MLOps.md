# MLOps

Well, I know DevOps, so my learning path for MLOps goes through DevOps in the beginning. 

## Similarities with DevOps: Shared Foundations

While MLOps extends traditional practices to accommodate data and probabilistic models, both disciplines rely on the same core engineering principles, architectural patterns, and underlying infrastructure.


| Aspect | Shared Foundation | Shared Implementation |
| :--- | :--- | :--- |
| **Infrastructure Layer** | Cloud Native & Containerized | Kubernetes, Docker, AWS/GCP/Azure |
| **Operational Goal** | Reliability & Automation | High availability, low latency, zero-downtime releases |
| **Workflow Management** | Automation Pipelines | Declarative CI/CD/CT pipelines via code |
| **Observability** | Telemetry & Incident Response | Metrics collection, structured logging, alert routing |
| **Culture & Practices** | Collaborative & Iterative | Infrastructure as Code (IaC), GitOps, Agile loops |

### 1. Underlying Infrastructure & Orchestration
* **Cloud-Native Foundations:** Both paradigms depend on cloud resources (AWS, GCP, Azure) to provide elastic compute, storage, and networking.
* **Kubernetes (K8s) & Containerization:** Both package services into Docker containers and leverage Kubernetes for container orchestration, auto-scaling, service discovery, and resource management (CPU/RAM for microservices, GPU/TPU for ML workloads).

### 2. Infrastructure as Code (IaC) & Configuration Management
* **Declarative Environments:** Both mandate that environments are provisioned declaratively using tools like Terraform, Pulumi, or Ansible.
* **Environment Parity:** Both enforce consistency across Development, Staging, and Production environments to prevent configuration drift and execution errors.

### 3. Pipeline-Driven Automation
* **Automated Lifecycles:** Both replace manual human intervention with automated execution triggers (e.g., GitHub Actions, GitLab CI, Argo Workflows).
* **Automated Quality Gates:** Both enforce automated testing before pushing artifacts to production—DevOps validates unit and integration passes; MLOps validates schema compatibility and model performance thresholds.

### 4. Enterprise Observability & System Monitoring
* **Core Metrics Tracking:** Both require real-time monitoring of operational health metrics, including request latency, error rates (HTTP 5xx), system throughput, and resource utilization (CPU, memory, disk I/O).
* **Logging & Tracing:** Both rely on centralized logging frameworks (e.g., ELK/EFK stack) and distributed tracing (e.g., OpenTelemetry) to diagnose production bottlenecks and failures.

### 5. Deployment Strategies & Zero-Downtime Releases
* **Progressive Delivery:** Both utilize blue-green deployments, canary releases, and shadow deployments to roll out updates safely without interrupting active user traffic.
* **Automated Rollbacks:** Both require automated fallback mechanisms to revert to a previous stable state if production health checks or performance metrics drop below predefined SLAs.

## Differences with DevOps

While **DevOps** governs the traditional software development lifecycle, **MLOps** extends these practices to handle the non-deterministic nature of machine learning systems.

| Dimension | DevOps | MLOps |
| :--- | :--- | :--- |
| **Primary Focus** | Code + Infrastructure | Code + Data + Models |
| **System Behavior** | Deterministic (Rule-based execution) | Probabilistic (Statistical prediction) |
| **Pipeline Lifecycle** | CI/CD (Integration & Deployment) | CI/CD/CT (Integration, Deployment, & Continuous Training) |
| **System Degradation** | Software bugs or infrastructure load | Performance degradation via Data & Concept Drift |
| **Core Team** | Software & DevOps Engineers, System Admins | Data Scientists, ML Engineers, Data Engineers, DevOps |

### 1. System Assets & Complexity
* **DevOps:** Manages code artifacts and infrastructure configurations. A specific code input reliably yields a deterministic system output.
* **MLOps:** Manages three interdependent assets: **Code**, **Data**, and **Model Artifacts**. Outputs are statistical, meaning identical code can yield different models if the training data changes.

### 2. CI/CD vs. CI/CD/CT (Continuous Training)
* **DevOps (CI/CD):** Automatically builds, tests, and deploys software binaries or container images whenever source code updates.
* **MLOps (CI/CD/CT):** Includes Continuous Integration (validating code and data schema) and Continuous Deployment (deploying model serving endpoints). It adds **Continuous Training (CT)**—an automated loop that retrains models upon data updates or performance drops.

### 3. Monitoring & Quality Degradation (Drift)
* **DevOps:** Monitors application health metrics such as uptime, latency, error rates, CPU/Memory utilization, and request throughput.
* **MLOps:** Monitors infrastructure metrics *plus* statistical model health:
  * **Data Drift:** Shifts in input data distribution compared to baseline training data.
  * **Concept Drift:** Changes in statistical relationships between input features and target labels over time.

### 4. Versioning & Reproducibility
* **DevOps:** Version control relies on tracking source code state (e.g., via Git tags) and container revisions (e.g., Docker tags).
* **MLOps:** Requires version synchronization across three distinct elements: source code, training dataset snapshots (e.g., via DVC), and model parameters/hyperparameters (e.g., via MLflow).

### 5. Validation & Testing Protocols
* **DevOps:** Relies on Unit, Integration, Regression, and End-to-End (E2E) functional tests.
* **MLOps:** Extends testing to include **Data Validation** (checking schema, null values, feature distributions) and **Model Validation** (evaluating accuracy, precision/recall, fairness/bias, and execution latencies before rollout).

## Tools
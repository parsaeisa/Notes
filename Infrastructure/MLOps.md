# MLOps

Well, I know DevOps, so my learning path for MLOps goes through DevOps in the beginning. 

## Similarities with DevOps

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
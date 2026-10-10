# Terraform

It's a **cloud-agnostic** for defining resources on cloud platforms. 

## 1. Core Concept: Single File vs. Directory Structure
Unlike CI/CD pipelines (e.g., `.gitlab-ci.yml`), Terraform does **not** rely on a single monolithic file. 
* Terraform operates on a **directory-level** basis.
* When running commands like `terraform plan` or `terraform apply`, Terraform automatically scans and merges **all `.tf` files** inside the current working directory.
* While all configurations can technically be written in one file, the industry standard separates responsibilities into modular files for maintainability and clarity.

## 2. Standard Terraform Module Layout
A clean, production-grade module typically consists of four core files:

1. **`main.tf`**: Core resource declarations (providers, cloud infrastructure resources).
2. **`variables.tf`**: Input variable declarations, data types, and default values.
3. **`outputs.tf`**: Return values exposed after provisioning (e.g., database endpoints, public IPs, bucket ARNs).
4. **`terraform.tfvars`**: Concrete values assigned to input variables (often environment-specific: staging, prod).

## 3. Practical Code Example: AWS S3 Bucket Provisioning

### `variables.tf` (Inputs & Configuration)
```hcl
variable "aws_region" {
  description = "Target AWS Region"
  type        = string
  default     = "eu-central-1" # Frankfurt
}

variable "environment" {
  description = "Deployment environment name"
  type        = string
  default     = "staging"
}

```

### `main.tf` (Resource Definitions)

```hcl
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Define an S3 bucket resource
resource "aws_s3_bucket" "app_storage" {
  bucket = "my-app-storage-${var.environment}-102938"

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Enable bucket versioning
resource "aws_s3_bucket_versioning" "storage_versioning" {
  bucket = aws_s3_bucket.app_storage.id

  versioning_configuration {
    status = "Enabled"
  }
}

```

### `outputs.tf` (Exported Values)

```hcl
output "bucket_name" {
  description = "The name of the provisioned S3 bucket"
  value       = aws_s3_bucket.app_storage.bucket
}

output "bucket_arn" {
  description = "The ARN identifier of the created S3 bucket"
  value       = aws_s3_bucket.app_storage.arn
}

```

## 4. Execution Lifecycle & CLI Workflow

1. `terraform init`: Initializes the working directory, downloads the required provider plugins (e.g., AWS, GCP, Azure), and sets up backend state storage.
2. `terraform plan`: Generates an execution plan by comparing the local `.tf` code against the live cloud infrastructure. Displays exact delta changes (create, update in-place, destroy).
3. `terraform apply`: Executes the planned changes against the cloud provider's API to provision the actual resources.
4. **`terraform.tfstate` (State File)**: A managed JSON file recording the exact real-world resource mapping. It tracks provisioned IDs and prevents configuration drift across future runs.

```

# Terraform

It's a **cloud-agnostic** for defining resources on cloud platforms. 

A simple example: 
```
# ۱. مشخص کردن Provider و ریجن AWS
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1" # ریجن فرانکفورت (مناسب برای پروژه‌های آلمان)
}

# ۲. ایجاد و کانفیگ S3 Bucket برای ذخیره عکس‌ها و Assetها
resource "aws_s3_bucket" "asset_storage" {
  bucket = "otto-delivery-product-assets-v1"

  tags = {
    Environment = "Production"
    Team        = "Delivery"
  }
}

# فعال‌سازی Versioning روی باکت برای امنیت فایل‌ها
resource "aws_s3_bucket_versioning" "storage_versioning" {
  bucket = aws_s3_bucket.asset_storage.id
  versioning_configuration {
    status = "Enabled"
  }
}

# ۳. ایجاد کلاستر ECS برای اجرای سرویس کانتینری Go
resource "aws_ecs_cluster" "backend_cluster" {
  name = "delivery-services-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
```
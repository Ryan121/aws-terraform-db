terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "RS-terraform"

  workspaces {
      name = "aws_s3_deployment"
    }
  }

    required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.33.0"
    }
  }
}

variable "region" {
  description = "The AWS region to create resources in."
  default     = "us-east-1"
}

provider "aws" {
  region = var.region
}

variable "bucket_name" {
  default = "awss3bucketrs311022"
}

variable "acl_value" {
  default = "private"
}


resource "aws_s3_bucket" "create_s3_bucket" {
  bucket              = "${var.bucket_name}"
  # bucket_prefix       = var.bucket_prefix
  force_destroy       = true
  object_lock_enabled = true
}
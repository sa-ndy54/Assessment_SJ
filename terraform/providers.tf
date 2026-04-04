terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    # Configure these backend values via terraform init -backend-config
    # Example: terraform init -backend-config="bucket=my-bucket" -backend-config="key=terraform/state" -backend-config="region=us-east-1"
  }
}

provider "aws" {
  region = var.region
}
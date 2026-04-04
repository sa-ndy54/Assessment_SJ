terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = var.state_bucket
    key    = "terraform/state"
    region = var.region
  }
}

provider "aws" {
  region = var.region
}
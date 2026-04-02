# Assessment_SJ
# AWS infra setup
# 🚀 Terraform AWS Infrastructure – E-commerce Platform

This project provisions a production-ready AWS infrastructure using Terraform for a scalable e-commerce application.

---

# 📌 Architecture Overview

The infrastructure includes:

- **Networking**
  - VPC with public & private subnets across 2 AZs
  - Internet Gateway & NAT Gateway
  - Proper route tables

- **Frontend**
  - S3 bucket for static website hosting
  - CloudFront CDN with HTTPS (ACM)

- **Backend**
  - ECS Fargate service (2 tasks)
  - Application Load Balancer (ALB)

- **Database**
  - RDS PostgreSQL (Multi-AZ, private)

- **Caching**
  - ElastiCache Redis

- **Streaming**
  - Amazon MSK (Kafka cluster)

- **DNS & SSL**
  - Route53 hosted zone
  - ACM certificate with DNS validation

- **Security**
  - Least privilege security groups

---

# 🏗️ Architecture Flow


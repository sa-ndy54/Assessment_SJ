# Terraform AWS Infrastructure

This project provisions AWS infrastructure using Terraform for **Shopyyy**

---

## 🚀 What I Built

- VPC with public & private subnets
- Internet Gateway + NAT Gateway
- ECS Fargate service (2 tasks)
- Application Load Balancer (ALB)
- S3 bucket for frontend
- CloudFront CDN
- RDS PostgreSQL (Multi-AZ)
- Redis (ElastiCache)
- Kafka (MSK)
- Route53 + ACM (SSL)
- Secure Security Groups

---

## 🏗️ Architecture

User → CloudFront  
→ S3 (Frontend)  
→ ALB → ECS (Backend API)  
→ RDS + Redis + MSK  

---

## ⚙️ How to Run

1. Clone repo
2. Add `terraform.tfvars`
3. Run:

```Terminal/VS Code
terraform init
terraform plan
terraform apply

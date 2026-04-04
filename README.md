# Shoppy AWS Infrastructure

Production AWS infrastructure for shopyyy.com built with Terraform.

## Architecture

```
Users → Route 53 → CloudFront (S3 Frontend) → ALB → ECS Fargate
                                              ↓
                                    RDS + Redis + MSK
```

## Services Used

- **Frontend**: CloudFront + S3 (CDN with SSL)
- **API**: Application Load Balancer + ECS Fargate (2 tasks)
- **Database**: RDS PostgreSQL (Multi-AZ)
- **Cache**: ElastiCache Redis
- **Messaging**: Amazon MSK Kafka
- **Network**: VPC with 2 public + 2 private subnets (us-east-1a, 1b)
- **DNS & SSL**: Route 53 + ACM Certificate

## Project Structure

```
terraform/
├── variables.tf           # Configuration variables
├── providers.tf           # AWS provider & S3 backend
├── outputs.tf             # Output endpoints
├── networking/            # VPC, subnets, security groups
├── dns-ssl/               # Route 53 & ACM
├── storage/               # S3 & CloudFront
├── load-balancer/         # ALB
├── compute/               # ECS cluster
└── database/              # RDS, Redis, MSK
```

## Quick Start

```bash
cd terraform
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform plan
terraform apply
```

## Key Configuration

- **Region**: us-east-1
- **VPC CIDR**: 10.0.0.0/16
- **DB**: db.t3.medium PostgreSQL
- **Cache**: cache.t3.micro Redis
- **ECS Tasks**: 256 CPU, 512 MB memory

## Important

- Terraform state stored in S3 backend
- Update `state_bucket` variable with your S3 bucket
- Database password managed by Secrets Manager
- All resources tagged by Environment and Project

## Cleanup

```bash
terraform destroy
```
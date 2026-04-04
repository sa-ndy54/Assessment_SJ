# AWS Infrastructure for Shoppy Application

This repository contains Terraform code to provision the complete AWS infrastructure for the Shoppy application (shopyyy.com).

## Architecture Overview

The infrastructure includes:
- **Networking**: VPC with public/private subnets, IGW, NAT GW, route tables
- **DNS & SSL**: Route 53 hosted zone, ACM certificate with DNS validation
- **CloudFront**: CDN distribution with S3 frontend and ALB API origins
- **S3**: Frontend static files bucket with Origin Access Control
- **Load Balancer**: Application Load Balancer in public subnets
- **Compute**: ECS Fargate cluster with service and tasks
- **Database**: RDS PostgreSQL with multi-AZ and Secrets Manager
- **Caching**: ElastiCache Redis cluster
- **Kafka**: Amazon MSK cluster
- **Security**: Properly configured security groups

## Project Structure

```
.
├── terraform/                    # Terraform configuration files
│   ├── providers.tf              # AWS provider and S3 backend
│   ├── variables.tf              # Input variables
│   ├── outputs.tf                # Output values
│   ├── terraform.tfvars.example  # Example variables file
│   ├── networking/               # Network infrastructure
│   │   ├── vpc.tf                # VPC, subnets, gateways, routes
│   │   └── security_groups.tf    # Security groups
│   ├── dns-ssl/                  # DNS and SSL certificates
│   │   └── dns_ssl.tf            # Route 53 and ACM
│   ├── storage/                  # Storage and CDN
│   │   ├── s3.tf                 # S3 bucket
│   │   └── cloudfront.tf         # CloudFront distribution
│   ├── load-balancer/            # Load balancing
│   │   └── alb.tf                # Application Load Balancer
│   ├── compute/                  # Compute resources
│   │   └── ecs.tf                # ECS cluster and service
│   └── database/                 # Data services
│       ├── rds.tf                # RDS PostgreSQL
│       ├── elasticache.tf        # Redis cache
│       └── msk.tf                # Kafka cluster
├── .gitignore                    # Git ignore rules
└── README.md                     # This file
```

## Prerequisites

- AWS CLI configured with appropriate permissions
- Terraform >= 1.0
- S3 bucket for Terraform state (update `state_bucket` variable)

## Deployment

1. **Initialize Terraform**:
   ```
   cd terraform
   terraform init
   ```

2. **Review the plan**:
   ```
   terraform plan
   ```

3. **Apply the changes**:
   ```
   terraform apply
   ```

4. **Get outputs**:
   ```
   terraform output
   ```

## Variables

Key variables to configure:
- `region`: AWS region (default: us-east-1)
- `vpc_cidr`: VPC CIDR block
- `state_bucket`: S3 bucket for Terraform state (required)
- `domain_name`: Domain name (default: shopyyy.com)
- `environment`: Environment tag (default: prod)
- `project`: Project tag (default: shoppy)

## Security Notes

- All resources are tagged with Environment and Project
- Security groups restrict access appropriately
- S3 bucket blocks public access
- Database credentials stored in Secrets Manager
- HTTPS enforced via CloudFront and ALB

## Cleanup

To destroy all resources:
```
terraform destroy
```

**Warning**: This will delete all provisioned infrastructure. Make sure to backup any important data first.
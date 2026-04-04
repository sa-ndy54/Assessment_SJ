resource "aws_msk_cluster" "main" {
  cluster_name           = "${var.project}-${var.environment}-msk"
  kafka_version          = "3.4.0"
  number_of_broker_nodes = 2

  broker_node_group_info {
    instance_type   = "kafka.t3.small"
    client_subnets  = aws_subnet.private[*].id
    security_groups = [aws_security_group.msk.id]

    storage_info {
      ebs_storage_info {
        volume_size = 1000
      }
    }
  }

  encryption_info {
    encryption_in_transit {
      client_broker = "TLS"
    }
  }

  tags = {
    Name        = "${var.project}-${var.environment}-msk"
    Environment = var.environment
    Project     = var.project
  }
}
resource "random_password" "db" {
  length  = 16
  special = true
}

resource "aws_secretsmanager_secret" "db" {
  name = "${var.project}-${var.environment}-db-secret"

  tags = {
    Name        = "${var.project}-${var.environment}-db-secret"
    Environment = var.environment
    Project     = var.project
  }
}

resource "aws_secretsmanager_secret_version" "db" {
  secret_id = aws_secretsmanager_secret.db.id
  secret_string = jsonencode({
    username = var.db_username
    password = random_password.db.result
  })
}

resource "aws_db_subnet_group" "main" {
  name       = "${var.project}-${var.environment}-db-subnet-group"
  subnet_ids = aws_subnet.private[*].id

  tags = {
    Name        = "${var.project}-${var.environment}-db-subnet-group"
    Environment = var.environment
    Project     = var.project
  }
}

resource "aws_db_instance" "main" {
  identifier             = "${var.project}-${var.environment}-db"
  engine                 = "postgres"
  engine_version         = "17"
  instance_class         = var.rds_instance_class
  allocated_storage      = 20
  db_name                = var.db_name
  username               = var.db_username
  password               = random_password.db.result
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  multi_az               = true
  publicly_accessible    = false
  skip_final_snapshot    = true

  tags = {
    Name        = "${var.project}-${var.environment}-db"
    Environment = var.environment
    Project     = var.project
  }
}

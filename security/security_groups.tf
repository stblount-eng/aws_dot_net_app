# Security Group for .NET WebAPI EC2 instances
resource "aws_security_group" "webapi_security_group" {
  name        = "webapi-security-group"
  description = "Security group for .NET WebAPI EC2 instances"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allowing inbound HTTP traffic from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allowing outbound traffic to anywhere
  }
}

# Security Group for RDS instance
resource "aws_security_group" "rds_security_group" {
  name        = "rds-security-group"
  description = "Security group for RDS instance"

  # Ingress rule to allow traffic from .NET WebAPI EC2 instances
  ingress {
    from_port                = 3306  # Assuming MySQL as the database, adjust port as needed
    to_port                  = 3306
    protocol                 = "tcp"
    security_groups          = [aws_security_group.webapi_security_group.id]
  }

  # Egress rule to allow outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allowing outbound traffic to anywhere
  }
}

output "rds_endpoint" {
  description = "Endpoint URL for the provisioned RDS instance"
  value       = aws_db_instance.main.endpoint
}

output "db_instance_id" {
  description = "Identifier for the provisioned RDS instance"
  value       = aws_db_instance.main.id
}

output "db_instance_arn" {
  description = "ARN for the provisioned RDS instance"
  value       = aws_db_instance.main.arn
}

output "cloudtrail_bucket_name" {
  value = aws_s3_bucket.cloudtrail_bucket.bucket
}
variable "db_subnet_group_name" {
  description = "Name of the RDS DB Subnet Group"
  type        = string
}

variable "db_subnet_ids" {
  description = "List of subnet IDs for the RDS DB Subnet Group"
  type        = list(string)
}

variable "db_instance_identifier" {
  description = "Identifier for the RDS instance"
  type        = string
}

variable "db_allocated_storage" {
  description = "Allocated storage size for the RDS instance"
  type        = number
}

variable "db_engine" {
  description = "Database engine for the RDS instance"
  type        = string
}

variable "db_engine_version" {
  description = "Database engine version for the RDS instance"
  type        = string
}

variable "db_instance_class" {
  description = "Instance class for the RDS instance"
  type        = string
}

variable "db_name" {
  description = "Name of the database to create on the RDS instance"
  type        = string
}

variable "db_username" {
  description = "Username for accessing the database on the RDS instance"
  type        = string
}

variable "db_password" {
  description = "Password for accessing the database on the RDS instance"
  type        = string
}

variable "db_security_group_id" {
  description = "ID of the security group to associate with the RDS instance"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket for CloudTrail logs"
  type        = string
}

# Terraform variables
variable "region" {
  description = "AWS provider region"
  type        = string
}

# Compute variables
variable "webapi_ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "webapi_instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the public subnet where the EC2 instance will be launched"
  type        = string
}

variable "webapi_availability_zones" {
  description = "List of availability zones for the Auto Scaling group"
  type        = list(string)
}

variable "webapi_name" {
  description = "Name of the .NET WebAPI EC2 instance"
  type        = string
}

variable "webapi_max_size" {
  description = "Maximum number of instances in the Auto Scaling group"
  type        = number
}

variable "webapi_min_size" {
  description = "Minimum number of instances in the Auto Scaling group"
  type        = number
}

variable "webapi_scaling_adjustment" {
  description = "Number of instances by which to scale the Auto Scaling group"
  type        = number
}

variable "webapi_scaling_cooldown" {
  description = "Cooldown period (in seconds) for scaling activities"
  type        = number
}

variable "webapi_ami_id" {
  description = "AMI ID for the Launch Configuration"
  type        = string
}

# CI/CD variables

variable "pipeline_name" {
  description = "Name of the CodePipeline"
  type        = string
}

variable "artifact_bucket" {
  description = "Name of the S3 bucket to store pipeline artifacts"
  type        = string
}

variable "github_oauth_token" {
  description = "OAuth token for accessing GitHub repository"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository URL"
  type        = string
}

variable "github_branch" {
  description = "GitHub branch to trigger the pipeline"
  type        = string
}

variable "build_project_name" {
  description = "Name of the CodeBuild project"
  type        = string
}

# Database variables
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

# Networking variables
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "Map of public subnets"
  type        = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}

variable "private_subnets" {
  description = "Map of private subnets"
  type        = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "igw_name" {
  description = "Name of the Internet Gateway"
  type        = string
}

# Monitoring variables
variable "cloudtrail_bucket" {
  description = "Name of the S3 bucket for CloudTrail logs"
  type        = string
}
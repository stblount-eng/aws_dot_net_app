terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = var.region
}

module "networking" {
  source = "./networking"
  vpc_cidr_block = var.vpc_cidr_block
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  vpc_name = var.vpc_name
  igw_name = var.igw_name
}

module "compute" {
  source = "./compute"
  webapi_ami                    = var.webapi_ami
  webapi_instance_type          = var.webapi_instance_type
  public_subnet_id              = var.public_subnet_id
  webapi_availability_zones     = var.webapi_availability_zones
  webapi_name                   = var.webapi_name
  webapi_max_size               = var.webapi_max_size
  webapi_min_size               = var.webapi_min_size
  webapi_scaling_adjustment     = var.webapi_scaling_adjustment
  webapi_scaling_cooldown       = var.webapi_scaling_cooldown
  webapi_ami_id                 = var.webapi_ami_id
}

module "database" {
  source = "./database"
  db_subnet_group_name     = var.db_subnet_group_name
  db_subnet_ids            = var.db_subnet_ids
  db_instance_identifier   = var.db_instance_identifier
  db_allocated_storage     = var.db_allocated_storage
  db_engine                = var.db_engine
  db_engine_version        = var.db_engine_version
  db_instance_class        = var.db_instance_class
  db_name                  = var.db_name
  db_username              = var.db_username
  db_password              = var.db_password
  db_security_group_id     = var.db_security_group_id
  bucket_name              = var.bucket_name
}

module "ci_cd" {
  source = "./ci_cd"
  artifact_bucket = var.artifact_bucket
  github_repo = var.github_repo
  github_oauth_token = var.github_oauth_token
  github_branch = var.github_branch
  pipeline_name = var.pipeline_name
  build_project_name =  var.build_project_name
}

module "security" {
  source = "./security"
}

module "monitoring" {
  source = "./monitoring"
  cloudtrail_bucket = var.cloudtrail_bucket
}
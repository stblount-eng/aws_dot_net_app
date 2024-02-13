variable "webapi_name" {
  description = "Name tag for the .NET WebAPI instance"
  type        = string
}

variable "webapi_ami" {
  description = "AMI ID for the .NET WebAPI instance"
  type        = string
}

variable "webapi_instance_type" {
  description = "Instance type for the .NET WebAPI instance"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the instance will be launched"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the public subnet where the instance will be launched"
  type        = string
}

variable "webapi_max_size" {
  description = "Maximum number of EC2 instances in the Auto Scaling group for .NET WebAPI"
  type        = number
}

variable "webapi_min_size" {
  description = "Minimum number of EC2 instances in the Auto Scaling group for .NET WebAPI"
  type        = number
}

variable "webapi_desired_capacity" {
  description = "Desired number of EC2 instances in the Auto Scaling group for .NET WebAPI"
  type        = number
}

variable "webapi_instance_type" {
  description = "Instance type for .NET WebAPI EC2 instances"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where EC2 instances will be launched"
  type        = string
}

variable "key_name" {
  description = "Name of the key pair to associate with EC2 instances"
  type        = string
}

variable "webapi_scaling_adjustment" {
  description = "Number of instances by which to scale .NET WebAPI EC2 instances"
  type        = number
}

variable "webapi_scaling_cooldown" {
  description = "Cooldown period (in seconds) for .NET WebAPI scaling activities"
  type        = number
}

variable "webapi_evaluation_periods" {
  description = "Number of periods over which to evaluate the scaling alarm"
  type        = number
}

variable "webapi_threshold" {
  description = "Threshold value for triggering scaling activities for .NET WebAPI EC2 instances"
  type        = number
}

variable "webapi_ami_id" {
  description = "ID of the Amazon Machine Image (AMI) for .NET WebAPI EC2 instances"
  type        = string
}

variable "webapi_availability_zones" {
  description = "List of availability zones where .NET WebAPI Auto Scaling group will launch instances"
  type        = list(string)
}

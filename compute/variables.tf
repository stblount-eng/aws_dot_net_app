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

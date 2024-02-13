# Create EC2 instance
resource "aws_instance" "webapi_instance" {
  ami                    = var.webapi_ami
  instance_type          = var.webapi_instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids     = [aws_security_group.webapi_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = var.webapi_name
  }
}

# Define Auto Scaling Group for .NET WebAPI EC2 instances
resource "aws_autoscaling_group" "webapi_autoscaling_group" {
  availability_zones        = var.webapi_availability_zones
  name                 = "${var.webapi_name}-autoscaling-group"
  max_size             = var.webapi_max_size
  min_size             = var.webapi_min_size
  launch_configuration = aws_launch_configuration.webapi_launch_configuration.name
}

# Define Launch Configuration for .NET WebAPI EC2 instances
resource "aws_launch_configuration" "webapi_launch_configuration" {
  name                        = "webapi-launch-configuration"
  image_id                    = var.webapi_ami_id
  instance_type               = var.webapi_instance_type
  security_groups             = [aws_security_group.webapi_security_group.id]
  lifecycle {
    create_before_destroy = true
  }
}

# Scaling Policy for .NET WebAPI EC2 instances
resource "aws_autoscaling_policy" "webapi_scaling_policy" {
  name                   = "webapi-scaling-policy"
  scaling_adjustment     = var.webapi_scaling_adjustment
  adjustment_type        = "ChangeInCapacity"
  cooldown               = var.webapi_scaling_cooldown
  autoscaling_group_name = aws_autoscaling_group.webapi_autoscaling_group.name
}

# Create SNS topic
resource "aws_sns_topic" "webapi_alerts_topic" {
  name = "WebAPIAlertsTopic"
}

# Create CloudWatch alarms
resource "aws_cloudwatch_metric_alarm" "webapi_errors_alarm" {
  alarm_name          = "WebAPIErrorsAlarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "Errors"
  namespace           = "DotNetWebAPI/Metrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"

  dimensions = {
    ServiceName = "WebAPI"
  }

  alarm_description = "Alarm triggered if errors occur in the WebAPI"
  alarm_actions     = [webapi_alerts_topic.arn]
}

# Create CloudTrail
resource "aws_cloudtrail" "webapi_cloudtrail" {
  name               = "WebAPICloudTrail"
  s3_bucket_name     = var.cloudtrail_bucket
  include_global_service_events = true
  is_multi_region_trail = true
}

# Enable CloudTrail logging for all regions
resource "aws_cloudtrail" "all_regions_cloudtrail" {
  name               = "AllRegionsCloudTrail"
  s3_bucket_name     = var.cloudtrail_bucket
  include_global_service_events = true
  is_multi_region_trail = true
}

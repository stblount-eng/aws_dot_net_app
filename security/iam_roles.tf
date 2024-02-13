# IAM Role for EC2 Instances to Access RDS
resource "aws_iam_role" "ec2_rds_access_role" {
  name = "ec2-rds-access-role"

  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = { Service = "ec2.amazonaws.com" }
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

# IAM Policy for EC2 Instances to Access RDS
resource "aws_iam_policy" "ec2_rds_access_policy" {
  name        = "ec2-rds-access-policy"
  description = "IAM policy for EC2 instances to access RDS"
  policy      = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "rds-db:connect"
        ]
        Resource = "*"
      }
    ]
  })
}

# Attach IAM Policy to IAM Role
resource "aws_iam_role_policy_attachment" "ec2_rds_access_policy_attachment" {
  role       = aws_iam_role.ec2_rds_access_role.name
  policy_arn = aws_iam_policy.ec2_rds_access_policy.arn
}

# IAM Role for RDS
resource "aws_iam_role" "rds_role" {
  name = "rds-role"

  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = { Service = "rds.amazonaws.com" }
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

# IAM Policy for RDS
resource "aws_iam_policy" "rds_policy" {
  name        = "rds-policy"
  description = "IAM policy for RDS instance"
  policy      = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["rds:*"]
        Resource = "*"
      }
    ]
  })
}

# Attach IAM Policy to IAM Role
resource "aws_iam_role_policy_attachment" "rds_policy_attachment" {
  role       = aws_iam_role.rds_role.name
  policy_arn = aws_iam_policy.rds_policy.arn
}

# IAM Role for CodePipeline
resource "aws_iam_role" "pipeline_role" {
  name = "codepipeline-role"

  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = { Service = "codepipeline.amazonaws.com" }
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

# IAM Policy for CodePipeline
resource "aws_iam_policy" "pipeline_policy" {
  name        = "codepipeline-policy"
  description = "IAM policy for CodePipeline"
  policy      = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "codepipeline:StartPipelineExecution",
          "codepipeline:GetPipelineExecution",
          "codepipeline:GetPipeline",
          "codepipeline:ListPipelines"
        ]
        Resource = "*"
      }
    ]
  })
}

# Attach IAM Policy to IAM Role
resource "aws_iam_role_policy_attachment" "pipeline_policy_attachment" {
  role       = aws_iam_role.pipeline_role.name
  policy_arn = aws_iam_policy.pipeline_policy.arn
}

# IAM Role for CodeBuild project
resource "aws_iam_role" "build_project_role" {
  name = "codebuild-role"

  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = { Service = "codebuild.amazonaws.com" }
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

# IAM Policy for CodeBuild project
resource "aws_iam_policy" "build_project_policy" {
  name        = "codebuild-policy"
  description = "IAM policy for CodeBuild project"
  policy      = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "codebuild:StartBuild",
          "codebuild:BatchGetBuilds",
          "codebuild:GetBuild",
          "codebuild:ListBuilds"
        ]
        Resource = "*"
      }
    ]
  })
}

# Attach IAM Policy to IAM Role
resource "aws_iam_role_policy_attachment" "build_project_policy_attachment" {
  role       = aws_iam_role.build_project_role.name
  policy_arn = aws_iam_policy.build_project_policy.arn
}

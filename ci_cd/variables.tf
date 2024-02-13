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

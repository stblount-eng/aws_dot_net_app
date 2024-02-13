# Create AWS CodePipeline
resource "aws_codepipeline" "webapi_pipeline" {
  name     = var.pipeline_name
  role_arn = aws_iam_role.pipeline_role.arn

  artifact_store {
    location = var.artifact_bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "SourceAction"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        OAuthToken      = var.github_oauth_token
        Repo            = var.github_repo
        Branch          = var.github_branch
        PollForSourceChanges = "true"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name            = "BuildAction"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["source_output"]
      version         = "1"

      configuration = {
        ProjectName = aws_codebuild_project.webapi_build_project.name
      }
    }
  }

  stage {
    name = "Test"

    action {
      name            = "TestAction"
      category        = "Test"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["source_output"]
      version         = "1"

      configuration = {
        ProjectName = aws_codebuild_project.test_project.name
      }
    }
  }
}

# Create CodeBuild project for running tests
resource "aws_codebuild_project" "test_project" {
  name          = "${var.pipeline_name}-test-project"
  description   = "CodeBuild project for running tests"
  service_role  = aws_iam_role.build_project_role.arn
  artifacts {
    type = "NO_ARTIFACTS"
  }
  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
  }

  source {
    type            = "CODEPIPELINE"
    buildspec       = "tests_buildspec.yml"
  }
}

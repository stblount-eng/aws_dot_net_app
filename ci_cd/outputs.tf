# Output CodePipeline URL
output "codepipeline_url" {
  value = aws_codepipeline.webapi_pipeline.id
}
module "lambda_application" {
  source            = "github.com/massdriver-cloud/terraform-modules//massdriver-application-aws-lambda"
  md_metadata       = var.md_metadata
  image             = var.runtime.image
  x_ray_enabled     = var.observability.x-ray.enabled
  retention_days    = var.observability.retention_days
  memory_size       = var.runtime.memory_size
  execution_timeout = var.runtime.execution_timeout
}

resource "aws_lambda_event_source_mapping" "sqs" {
  event_source_arn = var.event_source.data.infrastructure.arn
  function_name    = module.lambda_application.function_arn
}

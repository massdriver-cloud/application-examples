locals {
  api_id = split("/", var.api_gateway.data.infrastructure.arn)[2]

  split_role = split("/", module.application.identity)
  role_name  = element(local.split_role, length(local.split_role) - 1)
}

module "application" {
  source  = "github.com/massdriver-cloud/terraform-modules//massdriver-application"
  name    = var.md_metadata.name_prefix
  service = "function"
}

resource "aws_api_gateway_resource" "main" {
  rest_api_id = local.api_id
  parent_id   = var.api_gateway.data.infrastructure.root_resource_id
  path_part   = var.api.path
}

resource "aws_api_gateway_method" "main" {
  rest_api_id   = local.api_id
  resource_id   = aws_api_gateway_resource.main.id
  http_method   = var.api.http_method
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "main" {
  rest_api_id             = local.api_id
  resource_id             = aws_api_gateway_resource.main.id
  http_method             = aws_api_gateway_method.main.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.main.invoke_arn
}

resource "aws_lambda_function" "main" {
  function_name = var.md_metadata.name_prefix
  role          = module.application.identity
  image_uri     = "${var.runtime.image.uri}:${var.runtime.image.tag}"
  package_type  = "Image"
  publish       = true
  memory_size   = var.runtime.memory_size
  timeout       = var.runtime.execution_timeout

  environment {
    variables = module.application.envs
  }

  dynamic "tracing_config" {
    for_each = var.observability.x-ray.enabled ? [1] : []
    content {
      mode = "Active"
    }
  }
}

resource "aws_cloudwatch_log_group" "function_log_group" {
  name              = "/aws/lambda/${aws_lambda_function.main.function_name}"
  retention_in_days = var.observability.retention_days
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_iam_policy" "function_logging_policy" {
  name   = "${aws_lambda_function.main.function_name}-logging-policy"
  policy = <<EOF
{
  "Version" : "2012-10-17",
  "Statement" : [
    {
      "Action" : [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect" : "Allow",
      "Resource" : [
        "${aws_cloudwatch_log_group.function_log_group.arn}:*",
        "${aws_cloudwatch_log_group.function_log_group.arn}"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "function_logging_policy_attachment" {
  role       = local.role_name
  policy_arn = aws_iam_policy.function_logging_policy.arn
}

# module "budget" {
#   source       = "github.com/massdriver-cloud/terraform-modules//aws/forecasted-monthly-cost-budget"
#   limit_amount = var.budget.limit_amount
#   md_metadata  = var.md_metadata

#   subscriber_email_addresses = [
#     # var.budget.email_addresses
#     var.md_metadata.target.contact_email
#   ]
# }

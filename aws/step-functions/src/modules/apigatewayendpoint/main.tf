resource "aws_api_gateway_resource" "main" {
  rest_api_id = var.rest_api_id
  parent_id   = var.rest_api_root_resource_id
  path_part   = var.path_name
}

resource "aws_api_gateway_method" "main" {
  rest_api_id   = var.rest_api_id
  resource_id   = aws_api_gateway_resource.main.id
  http_method   = var.http_method
  authorization = "NONE"
}

resource "aws_api_gateway_deployment" "main" {
  rest_api_id = var.rest_api_id

  depends_on = [aws_api_gateway_method.main]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "main" {
  rest_api_id   = var.rest_api_id
  deployment_id = aws_api_gateway_deployment.main.id
  stage_name    = var.stage_name
}

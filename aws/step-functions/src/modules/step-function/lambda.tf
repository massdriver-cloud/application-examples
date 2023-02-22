resource "aws_lambda_function" "main" {
  for_each = toset(local.lambda_functions)
  function_name = each.value.name
  package_type  = "Image"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = each.value.handler
  image_uri     = "localhost:4510/${each.value.name}"
  publish       = true
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "${var.md_metadata.name_prefix}-lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role" "iam_for_sfn_state_machine" {
  name = "${var.md_metadata.name_prefix}-sfn"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "states.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

locals {
  template_file_rendered = templatefile("${path.module}/statemachine.json",
    {
      fizz_arn = aws_lambda_function.fizz.arn
      buzz_arn = aws_lambda_function.buzz.arn
    }
  )
}

resource "aws_sfn_state_machine" "main" {
  name     = var.md_metadata.name_prefix
  role_arn = aws_iam_role.iam_for_sfn_state_machine.arn

  definition = local.template_file_rendered
}

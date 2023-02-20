resource "aws_lambda_function" "buzz" {
  function_name = "buzz"
  package_type  = "Image"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.handler"
  image_uri     = "localhost:4510/buzz"
  publish       = true
}

resource "aws_lambda_function" "fizz" {
  function_name = "fizz"
  package_type  = "Image"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.handler"
  image_uri     = "localhost:4510/fizz"
  publish       = true
}

resource "aws_lambda_function" "fizzbuzz" {
  function_name = "fizzbuzz"
  package_type  = "Image"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.handler"
  image_uri     = "localhost:4510/fizzbuzz"
  publish       = true
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

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

resource "aws_iam_role" "iam_for_sfn" {
  name = "iam_for_sfn"

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

resource "aws_sfn_state_machine" "sfn_state_machine" {
  name     = var.md_metadata.name_prefix
  role_arn = aws_iam_role.iam_for_sfn.arn

  definition = local.template_file_rendered
}

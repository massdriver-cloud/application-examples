# resource "aws_api_gateway_rest_api" "api" {
#   name = var.md_metadata.name_prefix
# }

# resource "aws_api_gateway_method" "post" {
#   rest_api_id = aws_api_gateway_rest_api.api.id
#   resource_id = aws_api_gateway_rest_api.api.root_resource_id
# }


locals {
  lambda_functions = [
    {
      name = "buzz"
      handler = "index.handler"
    },
    {
      name = "fizz"
      handler = "index.handler"
    },
    {
      name = "fizzbuzz"
      handler = "index.handler"
    }
  ]
}

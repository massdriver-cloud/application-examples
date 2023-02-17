resource "aws_ecr_repository" "fizz" {
  name                 = "fizz"
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository" "buzz" {
  name                 = "buzz"
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository" "fizzbuzz" {
  name                 = "fizzbuzz"
  image_tag_mutability = "MUTABLE"
}

resource "aws_iam_user" "TerraformBuilder" {
  name = "terraform-builder"
  path = var.path
  force_destroy = true

  tags = {
    Name = "terraform-builder"
  }
}

resource "aws_iam_policy" "TerraformBuilderPolicy" {
  name = "terraform-builder-policy"
  path = var.path

  policy = file("${path.root}/terraform_builder_policy.json")
}

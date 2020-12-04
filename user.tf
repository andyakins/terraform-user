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

resource "aws_iam_user_policy_attachment" "TerraformBuilderPolicyAttachment" {
  user       = aws_iam_user.TerraformBuilder.name
  policy_arn = aws_iam_policy.TerraformBuilderPolicy.arn
}

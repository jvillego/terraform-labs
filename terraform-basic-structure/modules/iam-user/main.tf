resource "aws_iam_user" "this" {
  name = var.user_name
  tags = var.tags
}

output "user_name" {
  value = aws_iam_user.this.name
}

resource "aws_iam_user" "this" {
  name = var.user_name
  tags = var.tags
}

resource "aws_iam_group_membership" "this" {
  count = var.user_group != null ? 1 : 0 #cuando es 0 no crea este recurso, para este ejemplo cuando user_group no es nulo lo asocia

  name = aws_iam_user.this.name
  users = [aws_iam_user.this.name]
  group = var.user_group
}

output "user_name" {
  value = aws_iam_user.this.name
}

resource "aws_iam_group" "this" {
  name = var.group_name
}


## TODO reparar este recurso porque no funciona.
# resource "aws_iam_user_group_membership" "this" {
#   for_each = toset(var.user_names)
#   group = aws_iam_group.this.name
#   users = [each.value]
# }

output "group_name" {
  value = aws_iam_group.this.name
}

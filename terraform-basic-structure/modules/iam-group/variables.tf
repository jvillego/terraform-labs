variable "group_name" {
  description = "The name of the IAM group"
  type        = string
}

variable "user_names" {
  description = "A list of IAM user names to associate with the group"
  type        = list(string)
}

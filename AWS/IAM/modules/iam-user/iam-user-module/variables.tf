
variable "user_name" {
  description = "The name of the IAM user"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}


variable "user_group" {
  description = "The name of the group which belongs to"
  type        = string
  default     = null
}
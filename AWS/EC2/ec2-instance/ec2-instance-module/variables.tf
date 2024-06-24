variable "ami_id" {
  description = "AMI for instance"
  type        = string
  default     = "ami-0eaf7c3456e7b5b68"
}

variable "instance_type" {
  description = "Type of instance"
  type        = string
}

variable "server_name" {
  description = "Name or tag name for instance"
  type        = string
}

variable "user_data" {
  description = "User data script for ejecute on instance start"
  type        = string
  default     = ""
}

variable "key_pair_file" {
  description = "Key Pair"
  type        = string
  default     = null
}

variable "security_group_ids" {
  description = "Id of security group"
  type        = list(string)
}


variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

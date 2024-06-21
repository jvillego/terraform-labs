################################################################
# Developers Group
################################################################
module "dev_group" {
  source     = "../../../../AWS/IAM/modules/iam-group/iam-group-module"
  group_name = "developers"
  tags       = {
    Name        = "dev-iam-group"
    Environment = "dev"
    Team        = "DevOps"
    Project     = "Example"
    Owner       = "admin"
  }
}

################################################################
# Users of Developers Group
################################################################

module "lucy-dev" {
  source    = "../../../../AWS/IAM/modules/iam-user/iam-user-module"
  user_name = "lucy-dev"

  user_group = "developers"

  tags = {
    Name        = "lucy-dev"
    Environment = "Dev"
    Team        = "DevOps"
    Project     = "Example"
    Owner       = "admin"
  }
}


################################################################
# QA Group
################################################################
# module "qa_group" {
#   source     = "../../../../AWS/IAM/modules/iam-group/iam-group-module"
#   group_name = "qa"
#   tags       = {
#     Name        = "qa-iam-group"
#     Environment = "dev"
#     Team        = "DevOps"
#     Project     = "Example"
#     Owner       = "admin"
#   }
# }
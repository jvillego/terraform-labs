provider "aws" {
  region = "us-east-1"
}

module "prod_users" {
  source    = "../../modules/iam-user"
  user_name = "prod-user"
  tags      = {
    Environment = "prod"
  }
}

module "prod_group" {
  source     = "../../modules/iam-group"
  group_name = "prod-group"
  user_names = [module.prod_users.user_name]
}

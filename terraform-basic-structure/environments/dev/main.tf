provider "aws" {
  region = "us-west-2"
}

module "dev_users" {
  source     = "../../modules/iam-user"
  user_names = ["dev-user1", "dev-user2"]
  tags       = {
    Environment = "dev"
  }
}

module "dev_group" {
  source     = "../../modules/iam-group"
  group_name = "dev-group"
  user_names = module.dev_users.user_names
}

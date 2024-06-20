module "dev_users" {
  source     = "./iam-user-module"
  user_name = "lucy"
  tags       = {
    Environment = "dev"
    Project = "project-name"
    Owner = "owner-name"
  }
}
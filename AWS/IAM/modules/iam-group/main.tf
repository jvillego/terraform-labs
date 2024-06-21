module "dev_group" {
  source     = "./iam-group-module"
  group_name = "developers"
  tags       = {
    Environment = "dev"
    Project = "Example"
    Owner = "admin"
  }
}
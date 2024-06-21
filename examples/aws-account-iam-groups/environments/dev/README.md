# Module to manage accout iam groups


## definition

Example:
```
module "dev_group" {
  source     = "../../modules/iam-user"
  user_name = ["dev-user1", "dev-user2"]
  tags       = {
    Environment = "dev"
  }
}
```
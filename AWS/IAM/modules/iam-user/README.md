# This module allows to create a iam user


## module definition
```
module "dev_users" {
  source     = "../../modules/iam-user"
  user_name = ["dev-user1", "dev-user2"]
  tags       = {
    Environment = "dev"
  }
}
```
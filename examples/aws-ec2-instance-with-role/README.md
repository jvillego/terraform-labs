# This module allows to create a ec2 instance


## module use

Example:
```
module "front_ec2_instance" {
  #module
  source          = "./ec2-instance-module"

  #ec2 instance data
  ami_id          = "ami-0eaf7c3456e7b5b68"  #amazon linux 2 (free tier elegible)
  server_name     = "${var.application_name}-front"
  instance_type   = "t2.micro" #free tier elegible
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update
              EOF
  

  #key_pair data
  key_pair_file = "ec2-instance-pub.key.pub"

  #Security group data
  security_group_ids = [aws_security_group.webapp_sg.id]


  #tags
  tags = {
    Name        = "${var.application_name}-front"
    Environment = "development"
    Owner       = "@user"
    Team        = "DevOps"
    Project     = "AppName"
  }
}
```
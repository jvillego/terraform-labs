## En este ejemplo es necesario definir un sg y asociarlo al modulo de ec2
## también es necesario generar una llave publica con e igualmente asorciarla
## para generar la llave usar el siguente comando:
## ssh-keygen -t rsa -b 2048 -f "nombre-clave.key"


#########################################################
## FRONT
#########################################################
module "front_ec2_instance" {
  #module
  source          = "../../AWS/EC2/ec2-instance/ec2-instance-module"

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
    Owner       = "@jvillego"
    Team        = "DevOps"
    Project     = "Birna"
  }
}

#########################################################
## BACK
#########################################################

# module "back_ec2_instance" {
#   #module
#   source          = "../../AWS/EC2/ec2-instance/ec2-instance-module"

#   #ec2 instance data
#   ami_id          = "ami-0eaf7c3456e7b5b68"  #amazon linux 2 (free tier elegible)
#   server_name     = "${var.application_name}-back"
#   instance_type   = "t2.micro" #free tier elegible
#   user_data = <<-EOF
#               #!/bin/bash
#               sudo yum update
#               EOF
  
#   #key_pair data
#   key_pair_file = "ec2-instance-pub.key.pub"

#   #Security group data
#   security_group_ids = [aws_security_group.webapp_sg.id]


#   #tags
#   tags = {
#     Name        = "${var.application_name}-front" 
#     Environment = "development"
#     Owner       = "@jvillego"
#     Team        = "DevOps"
#     Project     = "Birna"
#   }
# }


#########################################################
## SECURITY GROUP
#########################################################

resource "aws_security_group" "webapp_sg" {
  name        = "webapp-sg"
  description = "Basic Security group allowing SSH and HTTP access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # allows port 80 for ingress
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  

  #allow all traffic for egress
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "webapp-sg" 
    Environment = "development"
    Owner       = "@jvillego"
    Team        = "DevOps"
    Project     = "Birna"
  }
}
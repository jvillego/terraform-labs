# ec2 instance
resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type

  user_data = var.user_data

  key_name = aws_key_pair.this[0].key_name
  
  vpc_security_group_ids = var.security_group_ids

  tags = var.tags

}

## ec2 key pair
resource "aws_key_pair" "this" {
  count = var.key_pair_file == null ? 0 : 1

  key_name   = "${var.server_name}-key-pair"
  public_key = file("./${var.key_pair_file}")

  tags = var.tags
}



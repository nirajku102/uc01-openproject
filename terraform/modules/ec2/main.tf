resource "aws_instance" "openproject" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_name
  user_data              = var.user_data_script

  tags = {
    Name = "OpenProject-Instance"
  }
}

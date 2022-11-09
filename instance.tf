resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "subnet-0c594c0e14426dc2c"

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = "lidor-key"

  tags = {
    Name = "web"
  }
    provisioner "local-exec" {
    command = "echo ansible_host=${aws_instance.example.private_ip} ansible_user=ubuntu  ansible_connection=ssh  ansible_become=yes >> hosts"
  }
}


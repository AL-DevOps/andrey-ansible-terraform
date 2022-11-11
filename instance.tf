resource "aws_instance" "web-server-for-app01" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.large"

  # the VPC subnet  --> andrey-public-sub-1c
  subnet_id = "subnet-0fee2d1c9e08f1996"

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = "andrey-key-frankfurt"
  
  # the server name in AWS
  tags = {
    Name = "web-app01"
  }
  
  # Creating the HOST file for Ansible
  provisioner "local-exec" {
    command = "echo ansible_host=${aws_instance.web-server-for-app01.private_ip} ansible_user=ubuntu  ansible_connection=ssh  ansible_become=yes >> hosts"
  }
}


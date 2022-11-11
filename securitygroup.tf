resource "aws_security_group" "andrey-allow-ssh" {
  vpc_id      = "vpc-05542a78d6f38bb4d"
  name        = "andrey-allow-ssh"
  description = "security group that allows ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "andrey-allow-ssh"
  }
}


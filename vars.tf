variable "AWS_REGION" {
  default = "eu-west-1"
}





variable "AMIS" {
  type = map(string)
  default = {

    eu-west-1 = "ami-096800910c1b781ba"
  }
}


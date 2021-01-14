# Variables: AWS Region
variable "aws_region" {
  type    = string
  default = "us-east-1"
}


# Variables: CIDR Block
variable "cidr_block" {
  default = "192.168.0.0/24"
}
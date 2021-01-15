# Variable: AWS Region
variable "aws_region" {
  default = "us-east-1"
}

# Variable: Ingress Rule
variable "ingressrules" {
  type    = list(number)
  default = [80, 443]
}

# Variable: Egress Rule
variable "egressrules" {
  type    = list(number)
  default = [80, 443, 25, 3306, 53, 8080]
}
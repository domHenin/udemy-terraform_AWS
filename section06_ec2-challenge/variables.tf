# Variable: AWS Region
variable "aws_region" {
  default = "us-east-1"
}

# Variable: Ingress Rules
variable "ingressrules" {
  type    = list(number)
  default = [80, 443]
}

# Variable: Egress Rules
variable "egressrules" {
  type    = list(number)
  default = [80, 443]
}
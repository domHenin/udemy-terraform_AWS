# Variable: AWS Region
variable "aws_region" {
//  default = "us-east-1"
  description = "AWS Region"
  type = string
}

# Variable: AWS Instance Type
variable "int_type" {
  description = "type of used instance"
  type = string
}

# Variable: Ingress Rules
variable "ingressrules" {
  description = "Rules for Ingress traffic"
  type    = list(number)
//  default = [80, 443]
}

# Variable: Egress Rules
variable "egressrules" {
  description = "Rules for Egress Traffic"
  type    = list(number)
//  default = [80, 443]
}
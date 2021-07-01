# Variables: EC2 Name
variable "container_name" {
  type = string
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

# Variable: Instance Type
variable "instance_type" {
  description = "used instance type"
  type        = string
}

# Variable: AMI Instance
variable "ami_lookup" {
  description = "lookup for ami"
  type        = string
}
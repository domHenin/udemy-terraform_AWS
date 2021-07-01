# Variables: EC2 Name
//variable "container_name" {
//  type = string
//}

# Variable: Ingress Rules
variable "ingressrules" {
  description = "rules used for protocol"
  type        = list(number)
}

# Variable: Egress Rules
variable "egressrules" {
  description = "rules used for protocol"
  type        = list(number)
}

# Variable: CIDR Range
variable "cidr_range" {
  description = "range used for cidr"
  type        = string
}

# Variable: instance id
//variable "instance_id" {
//  type = string
//}
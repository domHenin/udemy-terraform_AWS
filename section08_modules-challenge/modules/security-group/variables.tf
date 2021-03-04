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
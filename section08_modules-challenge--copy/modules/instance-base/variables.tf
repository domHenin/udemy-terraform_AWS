# Variable: AMI Lookup
variable "ami_lookup" {
  description = "lookup for ami"
  type        = string
}

# Variable: Instance Type
variable "int_type" {
  description = "type of used instance"
  type        = string
}

# Variable: AWS Instance Tag Name - Database
variable "db_tag" {
  description = "tag name"
  type        = string
}

# Variable: AWS Instance Tag Name - Web Server
variable "ws_tag" {
  description = "tag name"
  type        = string
}
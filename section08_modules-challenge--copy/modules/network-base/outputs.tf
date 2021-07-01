# Output: Public IP
output "publicIP" {
  value = aws_eip.ws_eip.public_ip
}

# output: Security Group Name
output "sg_name" {
  value = aws_security_group.web_serverSG.name
}
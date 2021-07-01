# Output -- Database Private IP
output "privateIP" {
  value = aws_instance.db_container.private_ip
}

# Output -- WebServer Instance ID
output "instance_id" {
  value = aws_instance.ws_container.id
}

# Output: WebServer Public IP
output "pub_ip" {
  value = module.eip.publicIP
}
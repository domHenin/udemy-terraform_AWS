# Resource: Elastic IP - web-server
resource "aws_eip" "ws_eip" {
    instance = var.instance_id
    vpc = true
}

# Output: Web-server Public IP
output "publicIP" {
    value = aws_eip.ws_eip.public_ip
}


# Output: Elastic IP -- web-server public ip
// output "ws_publicip" {
//     value = aws_instance.ws_container.public_ip
// }

# Output: Elastic IP: db-container private ip
// output "db-privateip" {
//     value = aws_instance.db_container.private_ip
// }
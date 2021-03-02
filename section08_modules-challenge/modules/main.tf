# Resource: EC2 Instance ; Database Container
resource "aws_instance" "db_container" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = "t2.micro"

    // connection_type

    tags = {
        Name = "Database Server"
    }
}

output "ip_output" {
    value = aws_instance.db_container.public_ip
}

// output "container_output" {
//     value = aws_instance.container.id
// }
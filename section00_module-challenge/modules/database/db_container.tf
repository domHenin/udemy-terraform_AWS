data "aws_ami" "db_ami" {
    owners      = ["379101102735"]
  most_recent = true

  filter {
    name   = "name"
    values = ["debian-stretch-hvm-*"]
  }
}


resource "aws_instance" "db_container" {
     ami = data.aws_ami.db_ami.id
    instance_type = "t2.micro"

    tags = {
        Name = "Database Container"
    }
}

output "db_privateIP" {
    value = aws_instance.db_container.private_ip
}




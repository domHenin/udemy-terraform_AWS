data "aws_ami" "ws_ami" {
    owners = 
    most_recent = true
    filter {
        name = "name" 
        values = ["debian-stretch-hvm-*"]
    }
}


resource "aws_instance" "web-server" {
    ami = aws_ami.ws_ami.id
    instance_type = "t2.micro"
    security_group = aws_security_group.allow-TLS.id

    tags = {
        Name = "Web-server Container"
    }
}
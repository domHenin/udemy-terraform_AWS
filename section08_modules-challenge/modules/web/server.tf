# Resource: EC2 Instance: web-server
resource "aws_instance" "ws_container" {
  ami             = "ami-032598fcc7e9d1c7a"
  instance_type   = "t2.micro"
  security_groups = [module.sg.sg_name]
  // call the present module {sg} and connecting it to security group output

  connection {
    type = "ssh"
    user = "admin"
  }

  user_data = file("files/server-script.sh")

  tags = {
    Name = "Web-Server"
  }
}

# Module: EIP
module "eip" {
  source = "../elasticIP"
  instance_id = aws_instance.ws_container.id
}

module "sg" {
  source = "../security-group"
}


output "pub_ip" {
  value = module.ws_eip.publicIP
}

# because of lines 21-24 this below block is no longer relevant 
# Output instance id
// output "instance_id" {
//   value = aws_instance.ws_container.id
// }


# Can delete -- ?
# Output -- Webserver Public IP
// output "publicIP" {
//   value = aws_eip.ws_eip.public_ip
// }
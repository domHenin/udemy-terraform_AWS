# Resource: EC2 Instance: web-server
resource "aws_instance" "ws_container" {
  ami             = var.ami_lookup
  instance_type   = var.instance_type
  security_groups = aws_security_group.web_serverSG
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

# Resource: Security Group
resource "aws_security_group" "web_serverSG" {
  name = "allow-HTTP"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
      from_port  = port.value
      to_port    = port.value
      protocol   = "TCP"
      cird_block = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

# Module: EIP
module "eip" {
  source      = "../elasticIP"
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

# TODO:
// create a database using ec2
// provide tag
// output private ip
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
      cidr_block = var.cidr_range
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = var.cidr_range
    }
  }
}


# Resource: Elastic IP - web-server
resource "aws_eip" "ws_eip" {
//  instance = [module.instance.instance_id]
  vpc      = true
}

//module "instance" {
//  source = "../instance-base"
//
//}

# Resource: Subnet
//resource "aws_subnet" "ws_subnet" {
//  cidr_block = var.cidr_range
//  vpc_id = aws_
//}

# Module: EIP
//module "eip" {
//  source      = "../elasticIP"
////  instance_id = aws_instance.ws_container.id
//  instance_id = module{aws_instance.ws_container.id}
//}

//module "sg" {
//  source = "../security-group"
//}


//output "pub_ip" {
//  value = module.ws_eip.publicIP
//}

# Output: Web-server Public IP
//output "publicIP" {
//value = aws_eip.ws_eip.public_ip
//}


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
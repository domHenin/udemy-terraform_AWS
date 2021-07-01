# RESOURCE: Database
resource "aws_instance" "db_container" {
  ami           = var.ami_lookup
  instance_type = var.int_type

  tags = {
    Name = var.db_tag
  }
}

# Resource: EC2 Instance: web-server
resource "aws_instance" "ws_container" {
  ami             = var.ami_lookup
  instance_type   = var.int_type
  security_groups = [module.sg.sg_name]
  // call the present module {sg} and connecting it to security group output

  connection {
    type = "ssh"
    user = "admin"
  }

  user_data = file("files/server-script.sh")

  tags = {
    Name = var.ws_tag
  }
}



module "eip" {
  source      = "../network-base"
//  instance_id = aws_instance.ws_container.id
//  container_name = aws_instance.ws_container.id
}

module "sg" {
  source = "../network-base"
}
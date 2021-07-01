# Provider: AWS
provider "aws" {
  region = var.aws_region
}


resource "aws_instance" "db_container" {
  ami           = "ami-032598fcc7e9d1c7a"
  instance_type = var.int_type

  tags = {
    Name = "DB Server"
  }
}

# Output: Public IP - EC2
output "ip_output" {
  value = aws_instance.db_container.public_ip
}

# Resource: EC2 Instance: web-server
resource "aws_instance" "ws_container" {
  ami             = "ami-032598fcc7e9d1c7a"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.web_serverSG.name]

  connection {
    type = "ssh"
    user = "admin"
  }

  user_data = file("files/server-script.sh")

  tags = {
    Name = "Web-Server"
  }
}

# Resource: Elastic IP: web-server
resource "aws_eip" "elasticIP" {
  instance = aws_instance.ws_container.id
  vpc      = true
}

# Output: Elastic IP: db-container private ip
output "PrivateIP" {
  value = aws_instance.db_container.private_ip
}

# Output: Elastic IP: web-server public ip
output "PublicIP" {
  value = aws_eip.elasticIP.public_ip
}


# Resource: Security Group
resource "aws_security_group" "web_serverSG" {
  name = "allow-HTTP"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
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

// TODO:
// 1. create a DB Server (ec2 instance with this title) and output the private IP
// 2. Create a web server and ensure it has a fixed public IP
// 3. Create a Security Group for the web server opening ports 80 and 443 (HTTP & HTTPS)
// 4. Run the provided script on the web server
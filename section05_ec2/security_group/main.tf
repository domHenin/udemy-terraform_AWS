# Provider: AWS
provider "aws" {
  region = var.aws_region
}

# Resource: EC2
resource "aws_instance" "myEC2" {
  ami                 = "ami-032598fcc7e9d1c7a"
  instance_type       = "t2.micro"
  aws_security_groups = [aws_security_group.web-traffic.name]
}

# Resource: Elastic IP
resource "aws_eip" "elasticIP" {
  instance = aws_instance.myEC2.id
}

output "EIP" {
  value = aws_eip.elasticIP.public_ip
}

# Resource: Security Group
resource "aws_security_group" "web-traffic" {
  name = "Allow HTTPS"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
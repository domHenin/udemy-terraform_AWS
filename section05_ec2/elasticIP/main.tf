# Provider: AWS
provider "aws" {
  region = var.aws_region
}

# Resource: VPC
resource "aws_instance" "myEC2" {
  ami           = "ami-032598fcc7e9d1c7a"
  instance_type = "t2.micro"


  tags = {
    Name = "first-instance"
  }
}

# Resource: EIP
resource "aws_eip" "elasticIP" {
  instance = aws_instance.myEC2.id
}

output "EIP" {
  value = aws_eip.elasticIP.public_ip
}
# Provider: AWS
provider "aws" {
  region = var.aws_region
}

# Resource: EC2 Instance
resource "aws_instance" "ec2" {
  ami           = "ami-032598fcc7e9d1c7a"
  instance_type = "t2.micro"

  tags = {
    Name = "fist-instance"
  }
}
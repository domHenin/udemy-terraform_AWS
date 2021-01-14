# Provider: AWS
provider "aws" {
  region = var.aws_region
}

# Resource: VPC
resource "aws_vpc" "myVPC" {
  cidr_block = var.cidr_block

  tags = {
      Name = "TerraformVPC"
  }
}


// TODO: 
// 1. create a new folder called: challenge01
// 2. create a VPC name "TerraformVPC"
// 3. cidr range: 192.168.0.0/24
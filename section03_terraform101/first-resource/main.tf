# Provider: AWS
provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "myVPC" {
  cidr_block = "10.0.0.0/16"
}
# Provider: AWS
provider "aws" {
  region = var.aws_region
}


module "container_module" {
  source   = "./modules/"
  container_name = "Name from Module"
}




// TODO:
// 1. Modularise Challenge 2 (EC2 Challenge) as best you can
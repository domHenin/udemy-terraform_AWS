# Provider: AWS
provider "aws" {
  region = var.aws_region
}

module "ec2_module" {
  source   = "./modules/ec2"
  ec2_name = "Name from Module"
}

output "module_output" {
  value = module.ec2_module.instance_id
}
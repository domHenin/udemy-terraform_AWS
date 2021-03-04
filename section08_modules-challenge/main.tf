# Provider: AWS
provider "aws" {
  region = var.aws_region
}


# Module are going to create two 
# Module: Database
module "db" {
  source = "../modules/database/"
}

# Module: Websever
module "web" {
  source = "../modules/web/"
}

# Output: Database Private IP
output "privateIP" {
  value = module.db_container.privateIP
}

# Output:
output "publicIP" {
  value = module.server.pub_ip
}

// module "container_module" {
//   source   = "./modules/"
//   container_name = "Name from Module"
//}





// TODO:
// 1. create a DB Server (ec2 instance with this title) and output the private IP
// 2. Create a web server and ensure it has a fixed public IP
// 3. Create a Security Group for the web server opening ports 80 and 443 (HTTP & HTTPS)
// 4. Run the provided script on the web server
# Provider: AWS
provider "aws" {
    region = var.aws_region
}


resource "aws_instance" "db_container" {
    ami = 
    instance_type = "t2.micro"


    connection {
        type = "ssh"
        user = "admin"
    }

    user_data = file("files/server-script")

    tags = {
        Name = "DB Server"
    }
}





// TODO:
// 1. create a DB Server (ec2 instance with this title) and output the private IP
// 2. Create a web server and ensure it has a fixed public IP
// 3. Create a Security Group for the web server opening ports 80 and 443 (HTTP & HTTPS)
// 4. Run the provided script on the web server
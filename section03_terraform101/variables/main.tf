# Provider: AWS
provider "aws" {
    region = "us-east-1"
}

# Variable: String
variable "vpcName" {
    type = string
    default = "my_vpc"
}

# Variable: Integer
variable "sshPort" {
    type = number
    default = 22
}

# Variable: Boolean
variable "enabled" {
    default = true
    // default = false
}

# Variable: List
variable "myList" {
    type = list(string)
    default = ["Value 1","Value 2"]
}

# Variable: Map
variable "myMap" {
    type = map
    default = {
        key1 = "Value 1"
        key2 = "Value 2"
    }
}

variable "inputName" {
    type = string
    description = "Set the name of the VPC: "
}

#################################################################
# Video: VPC "string" "list", "map", "inputs"

resource "aws_vpc" "myVPC" {
    cidr_block = "10.0.0.0/16"

    // tags = {
    //     Name = var.vpcName
    // }

    // tags = {
    //     Name = var.myList[0, 1]
    // }

    // tags = {
    //     Name = var.myMap["key1"]
    // }

    tags = {
        Name = var.inputName
    }
}

output "myOutput" {
    Value = aws_vpc.myVPC.id
}

variable "mytuple" {
    type = tuple([string, number, string])
    default = ["cat", 1, "dog"]
}

variable "myObject" {
    type = object({name = string, port = list(number)})
    default = {
        name = "sasuke"
        port = [22, 25, 80]
    }
}
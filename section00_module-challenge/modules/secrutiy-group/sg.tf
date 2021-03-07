resource "aws_security_group" "allow-TLS" {
    name = "allow TLS"
    description = "Allow TLS inbound traffic"
    vpc_id = 


    dynamic "ingress" {
        iterator = port
        for_each = var.ingressrules
        // description = "TLS from VPC"
        content {
            from_port = port.value
            to_port = port.value
            cidr_block = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
        iterator = port
        for_each = var.egressrules
        content {
            from_port = port.value
            to_port = port.value
            cidr_block = ["0.0.0.0/0"]
        } 
    }
}
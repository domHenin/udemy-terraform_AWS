# Resource: Security Group
resource "aws_security_group" "web_serverSG" {
    name = "allow-HTTP"

    dynamic "ingress" {
        iterator = port
        for_each = var.ingressrules
        content {
            from_port = port.value
            to_port = port.valueprotocol = "TCP"
            cird_block = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
        iterator = port
        for_each = var.egressrules
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}


# this is needed to be called through module for instance security_group
# Output:
output "sg_name" {
    value = aws_security_group.web_serverSG.name
}

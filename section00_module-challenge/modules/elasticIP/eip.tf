resource "aws_eip" "ws_eip" {
    instance = aws_instance.web-server.id
    vpc = true
}
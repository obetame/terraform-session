resource "aws_security_group" "demo1_sg" {
  name        = "demo1_sg"

  ingress {
    from_port        = var.WEB_PORT
    to_port          = var.WEB_PORT
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow ${var.WEB_PORT}"
  }
}

output "web_port" {
  value = var.WEB_PORT
}
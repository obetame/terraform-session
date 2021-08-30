resource "aws_security_group" "demo2_sg_instance" {
  name = "demo2_sg_instance"

  ingress {
    from_port = var.WEB_PORT
    to_port = var.WEB_PORT
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    Name = "allow ${var.WEB_PORT}"
  }
}

resource "aws_security_group" "demo2_sg_elb" {
  name = "demo2-sg-elb"

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"]
    from_port = var.WEB_PORT
    to_port = var.WEB_PORT
    protocol = "tcp"
  }

  egress {
    cidr_blocks = [
      "0.0.0.0/0"]
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
}
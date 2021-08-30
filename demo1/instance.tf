resource "aws_instance" "demo1" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.demo1_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p ${var.WEB_PORT} &
              EOF

  tags = {
    "Name" = "terraform-demo1"
  }
}

output "ip" {
  value = aws_instance.demo1.public_ip
}


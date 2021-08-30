resource "aws_launch_configuration" "demo2_lc" {
  image_id           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  security_groups = [aws_security_group.demo2_sg_instance.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p ${var.WEB_PORT} &
              EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "demo2_asg" {
  launch_configuration = aws_launch_configuration.demo2_lc.id
  availability_zones = data.aws_availability_zones.allAvailability.names

  min_size = 2
  max_size = 3

  load_balancers = [aws_elb.demo2_elb.name]
  health_check_type = "ELB"

  tag {
    key = "Name"
    value = "terraform-asg-example"
    propagate_at_launch = true
  }
}
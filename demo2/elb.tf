resource "aws_elb" "demo2_elb" {
	name = "demo2-elb"
	availability_zones = data.aws_availability_zones.allAvailability.names
	security_groups = [aws_security_group.demo2_sg_elb.id]

	listener {
		instance_port = var.WEB_PORT
		instance_protocol = "http"
		lb_port = var.WEB_PORT
		lb_protocol = "http"
	}

	health_check {
	  healthy_threshold = 2
	  unhealthy_threshold = 2
	  timeout = 2
	  target = "HTTP:${var.WEB_PORT}/"
	  interval = 30
	}
}
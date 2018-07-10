# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE CLASIC LOAD BALANCER
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_elb" "test" {
  name               = "foobar-terraform-elb"
  availability_zones = ["us-west-1b", "us-west-1b"]
  security_groups	 = ["${aws_security_group.load_balancer.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 5
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  tags {
    Name = "foobar-terraform-elb.test"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE CLASIC LAUNCH CONFIGURATION AND AUTO SCALING GROUP
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_launch_configuration" "as_conf" {
  image_id		= "${var.image_id}"
  instance_type = "${var.instance_type}"
  key_name		= "${var.key_name}"
  security_groups = ["${aws_security_group.web.id}"]

  user_data = "${file("./script/app-user-data.sh")}"
  
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "bar" {
  name                 = "terraform-asg-example"
  launch_configuration = "${aws_launch_configuration.as_conf.name}"
  min_size             = 1
  max_size             = 1
  desired_capacity     = 1
  availability_zones   = ["us-west-1b", "us-west-1b"]
  load_balancers	   = ["${aws_elb.test.id}"]

  lifecycle {
    create_before_destroy = true
  }
}
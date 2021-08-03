# Creat a new classic ELB

resource "aws_elb" "i-am-jolene" {
  name                      = "i-am-jolene-elb"
  cross_zone_load_balancing = true
  subnets                   = module.vpc.public_subnets

  listener {
    instance_port     = 3000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 3000
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "arn:aws:acm:ap-southeast-2:019550661163:certificate/c0afe947-a135-49f4-92d7-50b15a17e9c4"
  }

  tags = {
    Name = "i-am-jolene-elb"
  }
}


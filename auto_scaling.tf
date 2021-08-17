# Create an auto scaling group

resource "aws_autoscaling_group" "i-am-jolene" {
  name                      = "i-am-jolene"
  desired_capacity          = 2
  max_size                  = 3
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  vpc_zone_identifier       = [module.vpc.private_subnets[0],
                               module.vpc.private_subnets[1]
                               ]
  tags = concat(
    [
      {
        "key"                 = "Name"
        "value"               = "i-am-jolene-a"
        "propagate_at_launch" = true
      },
      {
        "key"                 = "Name"
        "value"               = "i-am-jolene-b"
        "propagate_at_launch" = true
      },
      {
        "key"                 = "Name"
        "value"               = "i-am-jolene-c"
        "propagate_at_launch" = true
      },
    ],
  )

  load_balancers = [aws_elb.i-am-jolene.name]

  launch_template {
    id      = aws_launch_template.spot_instance.id
    version = "$Latest"
  }
}
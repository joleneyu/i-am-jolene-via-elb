# Create a security group associats with EC2 instances

resource "aws_security_group" "app-sg" {
  name              = "APP-SG"
  description       = "Allow ELB inbound traffic"
  vpc_id            = module.vpc.vpc_id

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "APP-SG"
  }
}

# Apply the source SG rule to app-sg, comment out for testing ssh connection

# resource "aws_security_group_rule" "app-sg" {
#   type              = "ingress"
#   to_port           = 3000
#   protocol          = "tcp"
#   from_port         = 3000
#   security_group_id = aws_security_group.app-sg.id
#   source_security_group_id = aws_elb.i-am-jolene.source_security_group_id
# }

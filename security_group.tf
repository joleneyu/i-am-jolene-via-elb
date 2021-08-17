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

  tags = {
    Name = "APP-SG"
  }
}

# Apply the SG rule to app-sg, comment out for testing ssh connection

resource "aws_security_group_rule" "app-sg" {
  type              = "ingress"
  to_port           = 80
  protocol          = "tcp"
  from_port         = 80
  security_group_id = aws_security_group.app-sg.id
  source_security_group_id = aws_elb.i-am-jolene.source_security_group_id
}



# Create a security group to associate with ELB

resource "aws_security_group" "elb-sg" {
  name              = "ELB-SG"
  description       = "Allow public traffic get through"  
  vpc_id = module.vpc.vpc_id

    egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ELB-SG"
  }
}
  # ingress = {
  #     protocol  = "-1"
  #     cidr_blocks = ["0.0.0.0/0"]
  #     from_port = 0
  #     to_port   = 0
  #   }

# Apply security rules to elb-sg

resource "aws_security_group_rule" "elb-sg" {
  # count           = var.env == "dev" ? 1 : 0
  description       = "all-public-traffic"
  type              = "ingress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.elb-sg.id
}

resource "aws_security_group_rule" "default" {
  # count           = var.env == "dev" ? 1 : 0
  description       = "default-inbound-rule"
  type              = "ingress"
  self              = true
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  security_group_id = aws_security_group.elb-sg.id
}


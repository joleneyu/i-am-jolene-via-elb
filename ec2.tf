# Create 2 EC2 instances for our web application

resource "aws_instance" "i-am-jolene-a" {
  launch_template {
    name = aws_launch_template.spot_instance.name
    version = "$Latest"
  }
  subnet_id = module.vpc.private_subnets[0] 

  tags = {
    Name = "i-am-jolene-a"
  }
}

resource "aws_instance" "i-am-jolene-b" {
  launch_template {
    name = aws_launch_template.spot_instance.name
    version = "$Latest"
  }
  subnet_id = module.vpc.private_subnets[1] 

  tags = {
    Name = "i-am-jolene-b"
  }
}

# resource "aws_spot_instance_request" "i-am-jolene-a" {
#   ami           = "ami-0c9fe0dec6325a30c"
#   associate_public_ip_address = false
#   spot_type     = "one-time"
#   spot_price    = 0.005
#   instance_type = "t2.micro"
#   subnet_id     = module.vpc.private_subnets[0]
#   vpc_security_group_ids = [aws_security_group.app-sg.id]

#   tags = {
#     Name = "i-am-jolene-a"
#   }
# }

# resource "aws_spot_instance_request" "i-am-jolene-b" {
#   ami           = "ami-0c9fe0dec6325a30c"
#   associate_public_ip_address = false
#   spot_type     = "one-time"
#   spot_price    = 0.005
#   instance_type = "t2.micro"
#   subnet_id     = module.vpc.private_subnets[1]
#   vpc_security_group_ids = [aws_security_group.app-sg.id]

#   tags = {
#     Name = "i-am-jolene-b"
#   }
# }


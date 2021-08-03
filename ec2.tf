# Create 2 EC2 instances for our web application

resource "aws_spot_instance_request" "i-am-jolene-a" {
  ami           = "ami-0c9fe0dec6325a30c"
  associate_public_ip_address = false
  spot_type     = "one-time"
  spot_price    = 0.005
  instance_type = "t2.micro"
  subnet_id     = module.vpc.private_subnets[0]
  vpc_security_group_ids = [aws_security_group.app-sg.id]

  tags = {
    Name = "i-am-jolene-a"
  }
}

resource "aws_spot_instance_request" "i-am-jolene-b" {
  ami           = "ami-0c9fe0dec6325a30c"
  associate_public_ip_address = false
  spot_type     = "one-time"
  spot_price    = 0.005
  instance_type = "t2.micro"
  subnet_id     = module.vpc.private_subnets[1]
  vpc_security_group_ids = [aws_security_group.app-sg.id]

  tags = {
    Name = "i-am-jolene-b"
  }
}


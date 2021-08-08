# Create 2 EC2 instances for our web application

resource "aws_instance" "i-am-jolene-a" {
  launch_template {
    name = aws_launch_template.spot_instance.name
    version = "$Latest"
  }
  subnet_id = module.vpc.public_subnets[0]

  key_name = "test-key"

  tags = {
    Name = "i-am-jolene-a"
  }
}

resource "aws_instance" "i-am-jolene-b" {
  launch_template {
    name = aws_launch_template.spot_instance.name
    version = "$Latest"
  }
  subnet_id = module.vpc.public_subnets[1] 

  tags = {
    Name = "i-am-jolene-b"
  }
}


resource "aws_key_pair" "i-am-jolene" {
  key_name   = "test-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCaNeDukP/p5yN3U77CLwiJBoJiU27AH1D8IQBuxmKLUy79LRiIfxdSn0VkJEdz7hN0BNT3DTwDW0cZCDfhoLOnG6wC8Aj/7jjK2qXHb0QswC5ltccXeE4JoD5XNseCPlW8iQLYTs2ZWG3v3bndlpODXB83XiQIs005IkSIaXnAjp+qS647/lmTMWoYa72CnluNvSH1Ztb/SFLVrUSJahjzWWhixw6f8OnRWUeq98o+y8qnG5YpRSvoWJRd6ET62Mb6NcDulEPo534E5PNmoWrZgpd80891YBntAMjbtmdKhOVZXuQsve4uA8ZrJa2leM51IU8v/K2RtlIpTxKDnJZNYlnkmcodRpkhmOBTFlGcVuNnGmFTAaFqys/dxfVIrf5QJZinNUqV9rdJynnyJNoTJpQOBbUlrneEF4OBFFugkav5gs/B9bCRH7phWFbV4nP0fgDfs+VUOQW1Vu1xPBNnhdgL7o5o/j+RuHeRU7FFafUsB2v32phpB7h1AP5dHTc= jyu@Jingrans-Air.lan"
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


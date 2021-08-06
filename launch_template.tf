resource "aws_launch_template" "spot_instance" {
  name = "i-am-jolene"
  image_id = "ami-0c9fe0dec6325a30c"
  instance_type = "t2.micro"
  
  instance_market_options {
    market_type = "spot"
    spot_options {
      max_price   = 0.0044
      spot_instance_type = "one-time"
    }
  }
  
  network_interfaces {
    associate_public_ip_address = false
    security_groups = [aws_security_group.app-sg.id]
  } 
}
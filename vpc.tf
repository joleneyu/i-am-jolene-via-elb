data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~>2.0"

  name = "i-am-jolene"

  cidr            = var.cidr_block
  azs             = slice(data.aws_availability_zones.available.names, 0, var.subnet_count)
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az =false

  create_database_subnet_group = false


  tags = {
    Environment = "Development"
    Team        = "Network"
  }
}
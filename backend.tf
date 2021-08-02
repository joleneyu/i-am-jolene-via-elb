terraform {
  backend "s3" {
    bucket = "baobeier-terraform-states"
    key    = "path/to/i-am-jolene-via-elb"
    region = "ap-southeast-2"
  }
}
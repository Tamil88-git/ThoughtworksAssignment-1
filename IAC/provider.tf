provider "aws" {
  
  region = var.Region
  assume_role {
    role_arn     = var.RoleArn
  }
}


terraform {
  backend "s3" {
    bucket                  = "nonprod-state"
#    key                     = "env/${var.Env}/Wiki/${var.Region}/TW-${var.Region}-${var.Env}.tfstate"
	key                     = "env/uat/Wiki/us-west-1/TW-us-west-1-uat.tfstate"
    region                  = "us-west-1"
    shared_credentials_file = "/home/ec2-user/Wiki-aws"
	}
}

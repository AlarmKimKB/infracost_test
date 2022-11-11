provider "aws" {
  region  = "ap-northeast-2"
}

terraform {
  backend "s3" {
    bucket = "scott-terraform-study-tfstate"
    key    = "stg/terraform.tfstate"
    region = "ap-northeast-2"
    dynamodb_table = "terraform-locks"
    # encrypt        = true
  }
}

resource "aws_instance" "ubuntu" {
  ami                    = "ami-0e9bfdb247cc8de84"
  instance_type          = "t3.small"

  tags = {
    name = "atlantis-test-instance"
  }
}
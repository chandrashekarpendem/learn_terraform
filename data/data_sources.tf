data "aws_ami" "centos8" {
  owners = ""
}

output "ami_info" {
  value = data.aws_ami.centos8.arn
}

variable "region1" {
  region=us-east-1a
}

output "region" {
  value = var.region1
}
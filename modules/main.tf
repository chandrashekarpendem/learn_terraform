terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "terraforminfra1"
    key            = "chandra/terraform.tfstate"
    region         = "us-east-1"

  }
}

module "ec2" {
  source = "./ec2"
  ami_id=module.data.aws_ami

}

module "sg" {
  source = "./sg"
  vpc_id=module.vpc.vpc_id
  cidr_block=module.vpc.cidr_block
}

module "vpc" {
  source = "./vpc"

}

module "data" {
  source = "./data"
}
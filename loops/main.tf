module "aws_ami" {
  source = "./data"
}

module "resources" {
  source = "./resources"
  ami_id = module.aws_ami
  sg_id = module.security_group.sg_id
}

module "security_group" {
  source = "./sg"
  vpc_id = module.vpc.vpc_id
  cidr_block = module.vpc.cidr_block
}

module "vpc" {
  source = "./vpc"
}

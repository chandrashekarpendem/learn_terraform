variable "ami_id" {}
variable "sg_id" {}
variable "aws_instances" {
  default = {
    cart= {
      Name="cart"
      instance_type= "t2.micro"
    }
    catalogue= {
      Name="catalogue"
      instance_type= "t3.micro"
    }
  }
}
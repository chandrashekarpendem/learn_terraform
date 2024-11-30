variable "ami_id" {}
variable "sg_id" {}
variable "aws_instances" {
  default = {
    cart= {
      Name="cart"
      instance_type= var.instance_type=="t3.micro" ? "t2.micro" : var.instance_type
    }
    catalogue= {
      Name="catalogue"
      instance_type= "t3.micro"
    }
  }
}

variable "instance_type" {
  default = "t3.micro"
}
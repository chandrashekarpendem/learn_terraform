resource "aws_vpc" "roboshop" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "roboshop"
  }
}

output "vpc_id" {
  value = aws_vpc.roboshop.id
}

output "cidr_block" {
  value = aws_vpc.roboshop.cidr_block
}
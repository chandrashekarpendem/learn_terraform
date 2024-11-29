data "aws_ami" "roboshop_ami" {
  owners = [225989332181]
}

output "aws_ami" {
  value = data.aws_ami.roboshop_ami.id
}
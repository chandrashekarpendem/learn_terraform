data "aws_ami" "roboshop_ami" {
  most_recent = true
  owners = [225989332181]
}

output "roboshop_ami" {
  value = data.aws_ami.roboshop_ami.id
}
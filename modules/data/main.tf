
data "aws_ami" "roboshop_ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

output "aws_ami" {
  value = data.aws_ami.roboshop_ami.id
}
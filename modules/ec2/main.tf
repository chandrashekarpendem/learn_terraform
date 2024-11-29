resource "aws_instance" "Devops1" {
  ami           = var.ami_id
  instance_type = "t2.micro"

  tags = {
    Name = "hands_on"
  }
}
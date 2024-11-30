resource "aws_instance" "Devops1" {
  for_each = var.aws_instances
  ami           = var.ami_id
  instance_type = each.value.instance_type
  vpc_security_group_ids = var.sg_id

  tags = {
    Name = each.value["Name"]
  }
}

output "aws_instance_public_ip" {
  value = {
    for k, v in aws_instance.Devops1 : k => v.public_ip
  }
}

output "aws_instance_private_ip" {
  value = {
    value = {
      for k, v in aws_instance.Devops1 : k => v.private_ip
    }
  }
}
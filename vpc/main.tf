resource "aws_vpc" "auto_vpc" {
  cidr_block = var.cidr_block1
  tags       = merge(local.common_tags,{ Name= "${var.env}-vpc" })
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.auto_vpc.id
  cidr_block = var.cidr_block2

  tags       = merge(local.common_tags,{ Name= "${var.env}-Public_subnet" })

}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.auto_vpc.id
  cidr_block = var.cidr_block3

  tags       = merge(local.common_tags,{ Name= "${var.env}-private_subnet" })

}
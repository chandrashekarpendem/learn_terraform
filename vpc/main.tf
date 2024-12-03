resource "aws_vpc" "auto_vpc" {
  cidr_block = "10.0.0.0/16"
  tags       = merge(local.common_tags,{ Name= "${var.env}-vpc" })
}

resource "aws_subnet" "public_subnet" {
  count      = length(var.cidr_block)
  vpc_id     = aws_vpc.auto_vpc.id
  cidr_block = var.cidr_block[count.index]
  availability_zone = var.availability_zones[count.index]

  tags       = merge(local.common_tags,{ Name= "${var.env}-${count.index + 1}" })

}


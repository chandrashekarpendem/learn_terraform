resource "aws_vpc" "vpc-1" {
  cidr_block = "10.0.0.0/16"
  tags       = merge(local.common_tags,{ Name= "${var.env}-vpc" })
}

resource "aws_vpc" "vpc-2" {
  cidr_block = "10.0.0.0/8"
  tags       = merge(local.common_tags,{ Name= "${var.env}-vpc" })
}
resource "aws_subnet" "public_subnet" {
  count      = length(var.cidr_block_1)
  vpc_id     = aws_vpc.vpc-1.id
  cidr_block = var.cidr_block_1[count.index]
  availability_zone = var.availability_zones[count.index]

  tags       = merge(local.common_tags,{ Name= "${var.env}-Public_Subnet-${count.index + 1}" })

}

resource "aws_subnet" "private_subnet" {
  count      = length(var.cidr_block_2)
  vpc_id     = aws_vpc.vpc-2.id
  cidr_block = var.cidr_block_2[count.index]
  availability_zone = var.availability_zones[count.index]

  tags       = merge(local.common_tags,{ Name= "${var.env}-Private_Subnet-${count.index + 1}" })

}

resource "aws_vpc_peering_connection" "auto_peer" {
  peer_owner_id = data.aws_caller_identity.current_account.account_id
  peer_vpc_id = aws_vpc.vpc-1.id
  vpc_id      = aws_vpc.vpc-2.id
}
variable "env" {
  default = "dev"
}
variable "cidr_block_1" {
  default = ["10.0.0.0/17", "10.0.128.0/17"]
}
variable "cidr_block_2" {
  default = ["11.0.0.0/25", "11.0.0.128/25"]
}
variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b"]
}
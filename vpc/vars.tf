variable "env" {
  default = "deb"
}
variable "cidr_block" {
  default = [10.0.0.0/17, 10.0.128.0/17]
}
variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b"]
}
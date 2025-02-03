resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
  tags = {
    Name = "vpc_${var.name}"
  }
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support = var.enable_dns_support
}
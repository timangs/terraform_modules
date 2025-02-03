resource "aws_internet_gateway" "this" {
  vpc_id = var.vpc_id

  tags = {
    Name = "igw_${var.name}"
  }
}

resource "aws_route" "this" {
  route_table_id         = var.route_table_id
  destination_cidr_block = var.destination_cidr_block
}

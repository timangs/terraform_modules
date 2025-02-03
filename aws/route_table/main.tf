resource "aws_route_table" "this" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.name
  }
}

resource "aws_route" "dynamic_routes" {
  for_each = { for key, route in var.routes : key => route if route.cidr_block != null }
  route_table_id = aws_route_table.this.id
  destination_cidr_block    = each.value.cidr_block
  gateway_id                = each.value.gateway_id
  transit_gateway_id        = each.value.transit_gateway_id
  vpc_peering_connection_id = each.value.vpc_peering_connection_id
}

resource "aws_route_table_association" "this" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.this.id
}


resource "aws_lb" "this" {
    internal = var.internal
    load_balancer_type = var.load_balancer_type
    security_groups = var.security_groups #Required
    subnets = var.subnet_ids #Required
    enable_deletion_protection = var.enable_deletion_protection
    name = var.name
}

resource "aws_lb_target_group" "this" {
  name=var.name
  port = var.port
  protocol = var.protocol
  vpc_id = var.vpc_id
  health_check {
    healthy_threshold = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
    timeout = var.health_check_timeout
    interval = var.health_check_interval
    path = var.health_check_path
    matcher = var.health_check_matcher
  }
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port = var.port
  protocol = var.protocol
  default_action {
    type = var.action_type
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_lb_target_group_attachment" "this" {
  for_each = { for instance in aws_instance.web_servers : instance.id => instance
  }
  target_group_arn = aws_lb_target_group.this.arn
  target_id = each.value.instance_id
  port = var.port
}

# resource "aws_route" "dynamic_routes" {
#   for_each = { for key, route in var.routes : key => route if route.cidr_block != null }
#   route_table_id = aws_route_table.this.id
#   destination_cidr_block    = each.value.cidr_block
#   gateway_id                = each.value.gateway_id
#   transit_gateway_id        = each.value.transit_gateway_id
#   vpc_peering_connection_id = each.value.vpc_peering_connection_id
# }

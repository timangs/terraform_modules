variable "vpc_id" {
    description = "VPC ID"
    type        = string
}

variable "name" {
    description = "Name"
    type        = string
    default     = var.vpc_id
}

variable "route_table_id" {
    description = "Route Table ID"
    type        = string
}

variable "destination_cidr_block" {
    description = "Destination CIDR Block"
    type        = string
}
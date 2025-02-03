variable "vpc_id" {
    description = "VPC ID"
    type        = string
}

variable "route_table_id" {
    description = "Route Table ID"
    type        = string
}

variable "destination_cidr_block" {
    description = "Destination CIDR Block"
    type        = string
    default = "0.0.0.0/0"
}
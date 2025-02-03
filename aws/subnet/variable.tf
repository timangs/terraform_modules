variable "availability_zone" {
    description = "Availability Zone"
    type        = string  
}

variable "vpc_id" {
    description = "VPC ID"
    type        = string
}

variable "cidr_block" {
    description = "CIDR Block"
    type        = string
}

variable "name" {
    description = "Name"
    type        = string
    default = var.cidr_block
}

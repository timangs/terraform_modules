variable "cidr_block" {
    description = "cidr_block"
    type        = string
}

variable "name" {
    description = "Name"
    type        = string
    default = var.cidr_block
}
variable "vpc_id" {
    description = "VPC ID"
    type        = string  
}

variable "cidr_block" {
    description = "CIDR Block"
    type        = string
}

variable "subnet_id" {
    description = "Subnet ID"
    type        = string
}

variable "routes" {
  type = map(object(
    {
    cidr_block           = optional(string)
    gateway_id           = optional(string)
    transit_gateway_id   = optional(string)
    vpc_peering_connection_id = optional(string)
    destination_ipv6_cidr_block = optional(string)
    egress_only_internet_gateway = optional(string) 
    }
  ))
  default = {}
}

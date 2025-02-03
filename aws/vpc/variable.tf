variable "cidr_block" {
    description = "cidr_block"
    type        = string
}

variable "name" {
    description = "Name"
    type        = string
    default = "vpc"
}

variable "enable_dns_hostnames" {
    description = "Enable DNS Hostnames"
    default     = true
}

variable "enable_dns_support" {
    description = "Enable DNS Support"
    type        = bool
    default     = true
  
}
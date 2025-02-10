variable "internal" {
  type = bool
  default = false
}

variable "load_balancer_type" {
  type = string
  default = "application"
}

variable "security_groups" {
  type = list(string)
}

variable "subnet_ids" {
  type = list(string)
}

variable "enable_deletion_protection" {
  type = bool
  default = false
}

variable "name" {
  type = string
  default = "elb"
}
####################
variable "port" {
  type = number
  default = 80
}

variable "protocol" {
  type = string
  default = "HTTP"
}
variable "vpc_id" {
  type = string
}
variable "health_check_healthy_threshold" {
  type = number
  default = 3
}

variable "health_check_unhealthy_threshold" {
  type = number
  default = 3
}

variable "health_check_timeout" {
  type = number
  default = 5
}

variable "health_check_interval" {
  type = number
  default = 30
}

variable "health_check_path" {
  type = string
  default = "/"
}

variable "health_check_matcher" {
  type = string
  default = "200"
}
###########################
variable "action_type" {
  type = string
  default = "forward"
}

variable "target_id" {
  type = map(object(
    {
    cidr_block           = optional(string)
    instance_id = optional(string)
    }
  ))
  default = {}
}
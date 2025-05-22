variable "vpc_id" {
  description = "VPC ID"
  type        = string
  
}

variable "private_subnet_ids" {
  description = "Private subnet IDs"
  type        = list(string)
}
variable "public_subnet_ids" {
  description = "Public subnet IDs"
  type        = list(string)
}

variable "lb_sg" {
  description = "Security group for load balancer"
  type        = string
  
}


variable "target_group_arn" {
  description = "Target group ARN"
  type        = string
  
}

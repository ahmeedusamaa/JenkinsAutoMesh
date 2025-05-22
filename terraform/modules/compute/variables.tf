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


variable "public_ec2_sg" {
  description = "Security group for ec2 instances"
  type        = string
}

variable "private_ec2_sg" {
  description = "Security group for ec2 instances"
  type        = string
  
}

variable "public_key" {
  description = "Key pair name for EC2 instances"
  type        = string
}

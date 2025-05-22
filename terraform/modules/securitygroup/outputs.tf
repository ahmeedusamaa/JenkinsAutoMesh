output "public_ec2_sg_id" {
  value = aws_security_group.public_ec2_sg.id
  description = "The ID of the public EC2 security group"
  
}

output "private_ec2_sg_id" {
  value = aws_security_group.private_ec2_sg.id
  description = "The ID of the private EC2 security group"
  
}


output "lb_sg_id" {
  value = aws_security_group.lb_sg.id
  description = "The ID of the security group"
  
}
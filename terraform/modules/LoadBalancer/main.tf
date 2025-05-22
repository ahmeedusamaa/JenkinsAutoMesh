resource "aws_lb" "frontend_lb" {
  name               = "frontend-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.lb_sg]
  subnets            = [var.public_subnet_ids[0], var.public_subnet_ids[1]]

  enable_deletion_protection = true

  tags = {
    Name = "LB"
  }
}


resource "aws_lb_listener" "frontend_listener" {
  load_balancer_arn = aws_lb.frontend_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = var.target_group_arn
  }
}
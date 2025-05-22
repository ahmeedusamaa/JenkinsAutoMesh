data "aws_ami" "ubuntu_24_04" {
  most_recent = true
  owners      = ["099720109477"] 

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "public-ec2" {
  ami                    = data.aws_ami.ubuntu_24_04.id
  instance_type         = "t3.micro"
  key_name              = var.public_key
  vpc_security_group_ids = [var.public_ec2_sg]
  subnet_id             = var.public_subnet_ids[0]
  associate_public_ip_address = true

  tags = {
    Name = "ec2-public"
  }

}

resource "aws_instance" "private-ec2" {
  ami                    = data.aws_ami.ubuntu_24_04.id
  instance_type         = "t3.micro"
  key_name              = var.public_key
  vpc_security_group_ids = [var.private_ec2_sg]
  subnet_id             = var.private_subnet_ids[0]
  associate_public_ip_address = true

  tags = {
    Name = "ec2-private"
  }

}

resource "aws_lb_target_group" "frontend_tg" {
  name        = "frontend-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }
}


resource "aws_lb_target_group_attachment" "ec2_attach" {
  target_group_arn = aws_lb_target_group.frontend_tg.arn
  target_id        = aws_instance.private-ec2.id
}
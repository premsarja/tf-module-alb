resource "aws_lb" "test" {
  name               = var.ALB_NAME 
  internal           = var.INTERNAL
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [for subnet in aws_subnet.public : subnet.id]

  enable_deletion_protection = true


  tags = {
    Environment = "ROBOSHOP-{var.ENV}-alb"
  }
}
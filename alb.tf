resource "aws_lb" "alb" {
  name               = var.ALB_NAME 
  internal           = var.INTERNAL
  load_balancer_type = "application"
  security_groups    = var.INTERNAL ? ["aws_security_group.alb_private.id"] : [aws_security_group.alb_public.id]
  subnets            = var.INTERNAL ? data.terraform_remote_state.vpc.outputs.private.id : data.terraform_remote_state.vpc.outputs.public.id

  tags = {
    Environment = "ROBOSHOP-${var.ENV}-alb"
  }
}

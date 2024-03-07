resource "aws_lb" "alb" {
  name               = var.ALB_NAME 
  internal           = var.INTERNAL
  load_balancer_type = "application"
  security_groups    = var.INTERNAL ? ["aws_security_group.alb_private.id"] : [aws_security_group.alb_public.id]
  subnets            = var.INTERNAL ? data.terraform_remote_state.vpc.outputs.aws_subnet.private.id : data.terraform_remote_state.vpc.outputs.aws_subnet.public.id

  tags = {
    Environment = "ROBOSHOP-${var.ENV}-alb"
  }
}

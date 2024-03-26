resource "aws_lb" "test" {
  name               = var.ALB_NAME
  internal           = var.INTERNAL
  load_balancer_type = 
  security_groups    = 
  subnets            = 

  enable_deletion_protection = true


  tags = {
    Environment = "roboshop-(var.ENV)-alb"
  }
}
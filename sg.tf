resource "aws_security_group" "a/b-public" {
  name        = "roboshop allows public-alb-sg"
  description = "Allow TLS inbound traffics"
  vpc_id      =  data.terraform_remote_state.vpc.outputs.VPC_ID 


  ingress {
    description = "docdb from private network "
    from_port   = 80
    to_port     = 90
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "roboshop-{var.ENV}-public-alb-sg"
  }
}


resource "aws_security_group" "alb_public" {
  name        = "roboshop-${var.ENV}-public-alb-sg"
  description = "Allow TLS inbound traffics"
  vpc_id      =  data.terraform_remote_state.vpc.outputs.VPC_ID.id 


  ingress {
    description = "public network "
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
    Name = "roboshop-${var.ENV}-public-alb-sg"
  }
}

# creates private security group

resource "aws_security_group" "alb_private" {
  name        = "roboshop-${var.ENV}-private-alb-sg"
  description = "private traffics"
  vpc_id      =  data.terraform_remote_state.vpc.outputs.VPC_ID


  ingress {
    description = " private network "
    from_port   = 80
    to_port     = 90
    protocol    = "tcp"
    cidr_blocks = ["data.terraform_re"]
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


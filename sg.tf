# CREATES PUBLIC SG
resource "aws_security_group" "ALB_PUBLIC_SG" {
  name        = "roboshop-$(var.ENV)-public-alb-sg"
  description = "Allow public traffics"
  vpc_id =   data.terraform_remote_state.vpc.outputs.VPC_ID

  ingress {
    description = " allows external traffic "
    from_port   = 80
    to_port     = 80
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
    Name = "roboshop-${var.ENV}-public-alb-sg   "
  }
}


# creates PRIVATE SG

resource "aws_security_group" "ALB_PRIVATE_SG" {
  name        = "roboshop-$(var.ENV)-private-alb-sg"
  description = "Allow private traffics"
  vpc_id =   data.terraform_remote_state.vpc.outputs.VPC_ID

  ingress {
    description = " allows external traffic "
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["data.terraform_remote_state.vpc.outputs.VPC_CIDR ,data.terraform_remote_state.vpc.outputs.DEFAULT_VPC_CIDR"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "roboshop-${var.ENV}-private-alb-sg   "
  }
}


resource "aws_instance" "terraform" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  

  tags = {
    Name = "Terraform-${var.environment}"
    Project = "Roboshop"
  }
}

resource "aws_security_group" "allow_tls" {

  name        = "allow-all-terraform-${var.environment}" # this is for AWS account
  description = "Allow TLS inbound traffic and all outbound traffic"
 

  ingress {
    description = "Allow HTTP from load balancer"  
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0 
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-all-terraform-${var.environment}"
  }
}



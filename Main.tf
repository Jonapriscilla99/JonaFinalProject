#creating instance using terraform
provider "aws" {
  region = "eu-central-1"
}
resource "aws_instance" "JonaPriscilla_Terraform" {
  ami             = "ami-04e601abe3e1a910f"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.security_group_JonaPriscilla.name]
  key_name        = aws_key_pair.id_rsa.key_name
  tags = {
    "Name" = "JonaFinalProject_EC2_Instance"
  }
}


#Create security group using terraform
resource "aws_security_group" "security_group_JonaPriscilla" {
  name        = "security_group_JonaPriscilla"
  description = "create security group using terraform"
  vpc_id      = "vpc-073ddc7222e56fb87"
  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "security_group_JonaPriscilla"
  }
}


#Add key-pair
resource "aws_key_pair" "id_rsa" {
  key_name   = "id_rsa"
  public_key = file("id_rsa.pub")
}


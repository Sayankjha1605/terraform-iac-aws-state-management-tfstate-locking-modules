/*# Define the AWS provider
provider "aws" {
  region = "us-east-1" # Replace with your preferred AWS region
}*/

# Create a key pair
resource "aws_key_pair" "my_ssh_key" {
  key_name   = "my-key"
  public_key = file("${path.module}/terrakey.pub")
}

#Create a Vpc
resource "aws_default_vpc" "default" {
}

# Create a security group
resource "aws_security_group" "sg" {
  name        = "sg"
  vpc_id = aws_default_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Launch an EC2 instance
resource "aws_instance" "my_instance" {
  ami           = var.aws_ami
  instance_type = var.aws_instance_type
  key_name      = aws_key_pair.my_ssh_key.key_name
  security_groups = [aws_security_group.sg.name]
  count = var.aws_ec2_count

  tags = {
    Name = "${var.my_env}Infra-server"
  }
}


resource "aws_ec2_instance_state" "my_state" {
        count       = length(aws_instance.my_instance)
	instance_id = element(aws_instance.my_instance.*.id, count.index)
        state = "running"
}

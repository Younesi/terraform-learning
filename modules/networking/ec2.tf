resource "aws_instance" "ec2_public" {
  ami           = "ami-xxxxxxxxxxxxxxxxx" # Use a valid AMI ID for your region
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet_az1.id
  security_groups = [aws_security_group.sg_public.name]
  
  tags = {
    Name = "${var.project-name}-${var.env}-ec2-public"
  }
}

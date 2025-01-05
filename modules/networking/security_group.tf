resource "aws_security_group" "sg_public" {
  vpc_id = aws_vpc.vpc-test-default.id

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  tags = {
    Name = "${var.project-name}-${var.env}-sg-public"
  }
}

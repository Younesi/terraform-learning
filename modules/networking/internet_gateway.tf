resource "aws_internet_gateway" "igw-default" {
  vpc_id = aws_vpc.vpc-test-default.id

  tags = {
    Name = "${var.project-name}-${var.env}-igw"
  }
}

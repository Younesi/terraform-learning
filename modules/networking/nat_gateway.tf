# Elastic IP for NAT Gateway
resource "aws_eip" "nat" {
  vpc = true
}

# NAT Gateway
resource "aws_nat_gateway" "nat_az1" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet_az1.id

  tags = {
    Name = "${var.project-name}-${var.env}-nat-gw-az1"
  }
}

resource "aws_nat_gateway" "nat_az2" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet_az2.id

  tags = {
    Name = "${var.project-name}-${var.env}-nat-gw-az2"
  }
}

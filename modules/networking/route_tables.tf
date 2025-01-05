# Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc-test-default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-default.id
  }

  tags = {
    Name = "${var.project-name}-${var.env}-public-rt"
  }
}

# Associate public route table with public subnets
resource "aws_route_table_association" "public_rt_association_az1" {
  subnet_id = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_rt_association_az2" {
  subnet_id = aws_subnet.public_subnet_az2.id
  route_table_id = aws_route_table.public_route_table.id
}

# Private Route Tables
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc-test-default.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_az1.id
  }

  tags = {
    Name = "${var.project-name}-${var.env}-private-rt"
  }
}

# Route Table Associations for private subnets
resource "aws_route_table_association" "private_rt_association_az1" {
  subnet_id = aws_subnet.private_app_subnet_az1.id
  route_table_id = aws_route_table.private_route_table.id
}
resource "aws_route_table_association" "private_rt_association_az2" {
  subnet_id = aws_subnet.private_data_subnet_az2.id
  route_table_id = aws_route_table.private_route_table.id
}
resource "aws_vpc" "vpc-test-default" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
     Name = "${var.project-name}-${var.env}-vpc"
  }
}

resource "aws_internet_gateway" "igw-default" {
  vpc_id = aws_vpc.vpc-test-default.id

  tags = {
    Name = "${var.project-name}-${var.env}-igw"
  }
}

# use data source to get all the available AZs in the region
data "aws_availability_zones" "available_zones" {}

# create public subnet in AZ 1
resource "aws_subnet" "public_subnect_az1" {
  vpc_id = aws_vpc.vpc-test-default.id
  cidr_block = var.public_subnet_cidr_az1
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true // enable auto-assign public IP

  tags = {
     Name = "${var.project-name}-${var.env}-public-subnet-az1"
  }
}

# create public subnet in AZ 2
resource "aws_subnet" "public_subnect_az2" {
  vpc_id = aws_vpc.vpc-test-default.id
  cidr_block = var.public_subnet_cidr_az2
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

  tags = {
     Name = "${var.project-name}-${var.env}-public-subnet-az2"
  }
}

# create route table and add public route to the internet gatew
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

# associate public route table with public subnets
resource "aws_route_table_association" "public_rt_association_az1" {
  subnet_id = aws_subnet.public_subnect_az1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_rt_association_az2" {
  subnet_id = aws_subnet.public_subnect_az2.id
  route_table_id = aws_route_table.public_route_table.id
}

# create private app subnet in AZ 1
resource "aws_subnet" "private_app_subnet_az1" {
  vpc_id = aws_vpc.vpc-test-default.id
  cidr_block = var.private_app_subnet_cidr_az1
  availability_zone = data.aws_availability_zones.available_zones.names[0]

  tags = {
     Name = "${var.project-name}-${var.env}-private-app-subnet-az1"
  }
}

# create private app subnet in AZ 2
resource "aws_subnet" "private_app_subnet_az2" {
  vpc_id = aws_vpc.vpc-test-default.id
  cidr_block = var.private_app_subnet_cidr_az2
  availability_zone = data.aws_availability_zones.available_zones.names[1]

  tags = {
     Name = "${var.project-name}-${var.env}-private-app-subnet-az2"
  }
}

# create private data subnet in AZ 1
resource "aws_subnet" "private_data_subnet_az1" {
  vpc_id = aws_vpc.vpc-test-default.id
  cidr_block = var.private_data_subnet_cidr_az1
  availability_zone = data.aws_availability_zones.available_zones.names[0]

  tags = {
     Name = "${var.project-name}-${var.env}-private-data-subnet-az1"
  }
}

# create private data subnet in AZ 2
resource "aws_subnet" "private_data_subnet_az2" {
  vpc_id = aws_vpc.vpc-test-default.id
  cidr_block = var.private_data_subnet_cidr_az2
  availability_zone = data.aws_availability_zones.available_zones.names[1]

  tags = {
     Name = "${var.project-name}-${var.env}-private-data-subnet-az2"
  }
}
# Public Subnets
resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.vpc-test-default.id
  cidr_block              = var.public_subnet_cidr_az1
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project-name}-${var.env}-public-subnet-az1"
  }
}

resource "aws_subnet" "public_subnet_az2" {
  vpc_id                  = aws_vpc.vpc-test-default.id
  cidr_block              = var.public_subnet_cidr_az2
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project-name}-${var.env}-public-subnet-az2"
  }
}

# Private Subnets (App and Data)
resource "aws_subnet" "private_app_subnet_az1" {
  vpc_id            = aws_vpc.vpc-test-default.id
  cidr_block        = var.private_app_subnet_cidr_az1
  availability_zone = data.aws_availability_zones.available_zones.names[0]

  tags = {
    Name = "${var.project-name}-${var.env}-private-app-subnet-az1"
  }
}

resource "aws_subnet" "private_data_subnet_az2" {
  vpc_id            = aws_vpc.vpc-test-default.id
  cidr_block        = var.private_data_subnet_cidr_az2
  availability_zone = data.aws_availability_zones.available_zones.names[1]

  tags = {
    Name = "${var.project-name}-${var.env}-private-data-subnet-az2"
  }
}

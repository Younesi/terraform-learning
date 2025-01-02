# export the region
output "region" {
  value = var.region
}

# export the project name
output "project-name" {
  value = var.project-name
}

# export the environment
output "env" {
  value = var.env
}

# export the VPC ID
output "vpc_id" {
  value = aws_vpc.vpc-test-default.id
}

# export the internet gateway 
output "instance_tenancy_id" {
  value = aws_vpc.vpc-test-default.instance_tenancy.id
}

# export the public subnets
output "public_subnet_az1_id" {
  value = aws_subnet.public_subnet_az1.id
}
output "public_subnet_az2_id" {
  value = aws_subnet.public_subnet_az2.id
}

# export the private app subnets
output "private_app_subnet_az1_id" {
  value = aws_subnet.private_app_subnet_az1.id
}
output "private_app_subnet_az2_id" {
  value = aws_subnet.private_app_subnet_az2.id
}

# export the private data subnets
output "private_data_subnet_az1_id" {
  value = aws_subnet.private_data_subnet_az1.id
}
output "private_data_subnet_az2_id" {
  value = aws_subnet.private_data_subnet_az2.id
}

# export the availability zones
output "az1" {
  value = data.aws_availability_zones.available_zones.names[0]
}   
output "az2" {
  value = data.aws_availability_zones.available_zones.names[1]
}
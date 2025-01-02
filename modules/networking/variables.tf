# environment variables
variable "region" {}
variable "project-name" {}
variable "env" {}

# VPC variables
variable "vpc_cidr" {}
variable "public_subnet_cidr_az1" {}
variable "public_subnet_cidr_az2" {}
variable "private_app_subnet_cidr_az1" {}
variable "private_app_subnet_cidr_az2" {}
variable "private_data_subnet_cidr_az1" {}
variable "private_data_subnet_cidr_az2" {}

variable "region" {
  default = "eu-central-1"
}

variable "project-name" {
  default = "learn-terraform"
}

variable "env" {
  default = "prod"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16" 
}

variable "public_subnet_cidr_az1" {
  default = "10.0.1.0/24" 
}

variable "public_subnet_cidr_az2" {
  default = "10.0.2.0/24" 
}

variable "private_app_subnet_cidr_az1" {
  default = "10.0.3.0/24" 
}

variable "private_app_subnet_cidr_az2" {
  default = "10.0.4.0/24"
}

variable "private_data_subnet_cidr_az1" {
  default = "10.0.5.0/24" 
}

variable "private_data_subnet_cidr_az2" {
  default = "10.0.6.0/24" 
}

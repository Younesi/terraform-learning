# main.tf for the environment (prod/main.tf)
module "networking" {
  source = "../../modules/networking"

  region                     = var.region
  project-name               = var.project-name
  env                        = var.env
  vpc_cidr                   = var.vpc_cidr
  public_subnet_cidr_az1     = var.public_subnet_cidr_az1
  public_subnet_cidr_az2     = var.public_subnet_cidr_az2
  private_app_subnet_cidr_az1 = var.private_app_subnet_cidr_az1
  private_app_subnet_cidr_az2 = var.private_app_subnet_cidr_az2
  private_data_subnet_cidr_az1 = var.private_data_subnet_cidr_az1
  private_data_subnet_cidr_az2 = var.private_data_subnet_cidr_az2
}

# Security group reference for EC2 instance
resource "aws_instance" "public_ec2" {
  ami           = "ami-12345"  # Replace with your desired AMI
  instance_type = "t2.micro"   # Replace with your instance type
  subnet_id     = aws_subnet.public_subnet_az1.id  # Subnet to launch the instance in
  security_groups = [aws_security_group.sg_public.name]  # Reference to the security group

  tags = {
    Name = "${var.project-name}-${var.env}-public-ec2"
  }
}

resource "aws_eip" "ec2_eip" {
  instance = aws_instance.public_ec2.id
}

output "ec2_public_ip" {
  value = aws_eip.ec2_eip.public_ip
}
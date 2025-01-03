module "networking" {
  source = "../../modules/networking"

  region                     = "us-west-1"
  project-name               = "example-project"
  env                        = "prod"
  vpc_cidr                   = "10.0.0.0/16"
  public_subnet_cidr_az1     = "10.0.1.0/24"
  public_subnet_cidr_az2     = "10.0.2.0/24"
  private_app_subnet_cidr_az1 = "10.0.3.0/24"
  private_app_subnet_cidr_az2 = "10.0.4.0/24"
  private_data_subnet_cidr_az1 = "10.0.5.0/24"
  private_data_subnet_cidr_az2 = "10.0.6.0/24"
}
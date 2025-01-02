# configure aws provider to stablish connection between terraform and aws
provider "aws" {
  region = var.region
  profile = "default"

  default_tags {
     tags = {
       "project" = var.project-name
       "env" = var.env
       "automation" = "terraform"
     }
  }
}
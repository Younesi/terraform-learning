terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.82.2"
    }
  }
}

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
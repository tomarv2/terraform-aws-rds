terraform {
  required_version = ">= 1.0.1"
  required_providers {
    aws = {
      version = "~> 4.35"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

module "rds_instance" {
  source = "../../"

  instance_config = {
    demo = {
      username = "test"
      password = "test123!"
    }
  }
}

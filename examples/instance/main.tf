terraform {
  required_version = ">= 1.0.1"
  required_providers {
    aws = {
      version = "~> 3.74"
    }
  }
}

provider "aws" {
  region = var.region
}

module "common" {
  source = "git::git@github.com:tomarv2/terraform-global.git//common?ref=v0.0.1"
}

module "rds_instance" {
  source = "../../modules/instance"

  deploy_rds = true

  dbname          = "test"
  engine          = "postgres"
  engine_version  = "11.9"
  username        = "test"
  password        = "test123!"
  security_groups = [module.security_group.security_group_id]
  #-------------------------------------------
  # Do not change the teamid, prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

module "security_group" {
  source = "git::git@github.com:tomarv2/terraform-aws-security-group.git?ref=v0.0.10"

  security_group_ingress = {
    default = {
      description = "postgres"
      from_port   = 5432
      protocol    = "tcp"
      to_port     = 5432
      self        = false
      cidr_blocks = module.common.cidr_for_sec_grp_access
      type        = "ingress"
    }
  }
  #-------------------------------------------
  # Do not change the teamid, prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}

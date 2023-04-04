terraform {
  required_version = ">= 1.0.1"
  required_providers {
    aws = {
      version = "~> 4.61"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

module "common" {
  source = "github.com/tomarv2/terraform-global.git//common?ref=v0.0.1"
}

module "aurora_cluster" {
  source = "../../"

  aurora_cluster_config = {
    demo = {
      master_username        = "test"
      master_password        = "test123!"
      vpc_security_group_ids = module.security_group.id
      instance_config = {
        demowriter = {
          engine = "aurora-postgresql"
        }
        demoreader = {
          engine = "aurora-postgresql"
        }
      }
    }
  }
}

module "security_group" {
  source = "github.com/tomarv2/terraform-aws-security-group.git"

  config = {
    demo_rds = {
      all_ingress_rules = [
        {
          description = "https"
          type        = "ingress"
          from_port   = 5432
          protocol    = "tcp"
          to_port     = 5432
          self        = true
          cidr_blocks = []
        }
      ]
      all_egress_rules = [
        {
          description = "outbound traffic"
          from_port   = 0
          protocol    = "-1"
          type        = "egress"
          to_port     = 0
          self        = false
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }
  }
}

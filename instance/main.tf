terraform {
  required_version            = ">= 0.14"
  required_providers {
    aws = {
      version                     = "~> 2.61"
    }
  }
}

provider "aws" {
  region                      = var.aws_region
  profile                     = var.profile_to_use
}

module "global" {
  source                      = "git::git@github.com:tomarv2/terraform-global.git//aws?ref=0.0.1"
}

module "securitygroup" {
  source                      = "git::git@github.com:tomarv2/terraform-aws-securitygroup.git?ref=0.0.1"

  email                       = var.email
  teamid                      = var.teamid
  prjid                       = var.prjid
  profile_to_use              = var.profile_to_use
  aws_region                  = var.aws_region
  service_ports               = var.service_ports == "" ? [""] :  [var.service_ports]
}

locals {
  shared_tags  = map(
      "Name", "${var.teamid}-${var.prjid}",
      "Owner", var.email,
      "Team", var.teamid,
      "Project", var.prjid
  )
}

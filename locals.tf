locals {
  alias_settings = flatten([
    for instance, config in var.aurora_cluster_config : [
      for k, v in config.instance_config : {
        identifier          = k
        engine              = try(v.engine, "aurora-postgresql")
        instance_class      = try(v.instance_class, "db.t3.medium")
        publicly_accessible = try(v.publicly_accessible, false)
        promotion_tier      = try(v.promotion_tier, null)
      }
  ]])
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}
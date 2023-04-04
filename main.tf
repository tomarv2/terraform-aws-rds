module "global" {
  source = "github.com/tomarv2/terraform-global.git//aws?ref=v0.0.1"
}

resource "aws_db_instance" "this" {
  for_each                        = var.instance_config
  db_name                         = each.key
  identifier                      = each.key
  engine                          = try(each.value.engine, "postgres")
  engine_version                  = try(each.value.engine_version, "14.4")
  username                        = each.value.username
  password                        = each.value.password
  allocated_storage               = try(each.value.allocated_storage, 20)
  storage_type                    = try(each.value.storage_type, "standard")
  storage_encrypted               = try(each.value.storage_encrypted, false)
  allow_major_version_upgrade     = try(each.value.allow_major_version_upgrade, false)
  apply_immediately               = try(each.value.apply_immediately, true)
  availability_zone               = try(each.value.availability_zone, "us-west-2b")
  backup_retention_period         = try(each.value.backup_retention_period, 7)
  backup_window                   = try(each.value.backup_window, "09:46-10:16")
  instance_class                  = try(each.value.instance_class, "db.t3.micro")
  db_subnet_group_name            = try(each.value.db_subnet_group_name, "")
  delete_automated_backups        = try(each.value.delete_automated_backups, true)
  max_allocated_storage           = try(each.value.max_allocated_storage, 0)
  enabled_cloudwatch_logs_exports = try(each.value.enabled_cloudwatch_logs_exports, [])
  maintenance_window              = try(each.value.maintenance_window, "Mon:00:00-Mon:03:00")
  multi_az                        = try(each.value.multi_az, false)
  port                            = try(each.value.port, 5432)
  publicly_accessible             = try(each.value.publicly_accessible, false)
  skip_final_snapshot             = try(each.value.skip_final_snapshot, true)
  vpc_security_group_ids          = try(each.value.vpc_security_group_ids, [])
  monitoring_interval             = try(each.value.monitoring_interval, 0)
  parameter_group_name            = try(each.value.parameter_group_name, "")
  tags                            = merge(local.shared_tags, var.extra_tags)
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_rds_cluster" "this" {
  for_each                        = var.aurora_cluster_config
  database_name                   = each.key
  cluster_identifier              = each.key
  engine_mode                     = try(each.value.engine_mode, "provisioned")
  engine                          = try(each.value.engine, "aurora-postgresql")
  engine_version                  = try(each.value.engine_version, "14.4")
  master_username                 = each.value.master_username
  master_password                 = each.value.master_password
  storage_encrypted               = try(each.value.storage_encrypted, false)
  availability_zones              = try(each.value.availability_zones, ["us-west-2a", "us-west-2b", "us-west-2c"])
  backup_retention_period         = try(each.value.backup_retention_period, 1)
  preferred_backup_window         = try(each.value.preferred_backup_window, "09:46-10:16")
  preferred_maintenance_window    = try(each.value.preferred_maintenance_window, "Mon:00:00-Mon:03:00")
  db_subnet_group_name            = try(each.value.db_subnet_group_name, join("", [for subnet in aws_db_subnet_group.this : subnet.name]))
  vpc_security_group_ids          = try(each.value.vpc_security_group_ids, [])
  deletion_protection             = try(each.value.deletion_protection, false)
  port                            = try(each.value.port, 5432)
  skip_final_snapshot             = try(each.value.skip_final_snapshot, true)
  final_snapshot_identifier       = try(each.value.final_snapshot_identifier, null)
  enabled_cloudwatch_logs_exports = try(each.value.enabled_cloudwatch_logs_exports, [])
  copy_tags_to_snapshot           = try(each.value.copy_tags_to_snapshot, false)
  tags                            = merge(local.shared_tags, var.extra_tags)

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_rds_cluster_instance" "this" {
  for_each = { for i in local.alias_settings : i.identifier => i }

  identifier           = each.value.identifier
  engine               = each.value.engine
  instance_class       = each.value.instance_class
  publicly_accessible  = each.value.publicly_accessible
  promotion_tier       = each.value.promotion_tier
  db_subnet_group_name = join("", [for subnet in aws_db_subnet_group.this : subnet.name])
  cluster_identifier   = join("", [for cluster in aws_rds_cluster.this : cluster.id])
  tags                 = merge(local.shared_tags, var.extra_tags)

  lifecycle {
    create_before_destroy = true
  }
  depends_on = [aws_rds_cluster.this, aws_db_instance.this]
}

resource "aws_db_subnet_group" "this" {
  for_each   = var.aurora_cluster_config
  name       = each.key
  subnet_ids = module.global.list_of_subnets[local.account_id][local.region]
  tags       = merge(local.shared_tags, var.extra_tags)
}

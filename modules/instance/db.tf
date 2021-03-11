resource "aws_db_instance" "default" {
  count = var.deploy_rds ? 1 : 0

  identifier     = "${var.teamid}-${var.prjid}"
  engine         = var.engine
  engine_version = var.engine_version
  name           = var.dbname
  username       = var.username
  password       = var.password

  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
  storage_encrypted = var.storage_encrypted

  allow_major_version_upgrade     = var.allow_major_version_upgrade
  apply_immediately               = var.apply_immediately
  availability_zone               = var.availability_zone
  backup_retention_period         = var.backup_retention_period
  backup_window                   = var.preferred_backup_window
  tags                            = merge(local.shared_tags)
  instance_class                  = var.instance_class
  db_subnet_group_name            = var.db_subnet_group_name
  delete_automated_backups        = var.delete_automated_backups
  max_allocated_storage           = var.max_allocated_storage
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  maintenance_window              = var.maintenance_window
  multi_az                        = var.multi_az
  port                            = var.service_ports
  publicly_accessible             = var.is_public
  skip_final_snapshot             = var.skip_final_snapshot
  vpc_security_group_ids          = var.security_groups_to_use
  monitoring_interval             = var.monitoring_interval
  parameter_group_name            = var.parameter_group_name == "" ? "" : var.parameter_group_name

  lifecycle {
    create_before_destroy = true
  }
}

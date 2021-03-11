resource "aws_rds_cluster" "aurora_cluster" {
  count = var.deploy_rds_cluster ? 1 : 0

  engine_mode     = var.engine_mode
  engine          = var.engine
  engine_version  = var.engine_version
  database_name   = var.dbname
  master_username = var.rds_master_username
  master_password = var.rds_master_password

  storage_encrypted  = var.storage_encrypted
  cluster_identifier = "${var.teamid}-${var.prjid}"
  availability_zones = var.availability_zones

  backup_retention_period         = var.backup_retention_period
  preferred_backup_window         = var.preferred_backup_window
  preferred_maintenance_window    = var.maintenance_window
  db_subnet_group_name            = aws_db_subnet_group.default.name
  vpc_security_group_ids          = var.security_groups_to_use
  deletion_protection             = var.delete_protection
  port                            = var.service_ports
  skip_final_snapshot             = var.skip_final_snapshot
  final_snapshot_identifier       = var.final_snapshot_identifier
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  copy_tags_to_snapshot           = var.copy_tags_to_snapshot
  tags                            = merge(local.shared_tags)

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_rds_cluster_instance" "writer" {
  engine               = var.engine
  count                = var.number_of_writer_instances
  identifier           = "${var.prjid}-${count.index}"
  cluster_identifier   = join("", aws_rds_cluster.aurora_cluster.*.id)
  instance_class       = var.writer_instance_class
  db_subnet_group_name = aws_db_subnet_group.default.name
  publicly_accessible  = var.is_public

  tags = merge(local.shared_tags)

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "${var.teamid}-${var.prjid}"
  subnet_ids = module.global.list_of_subnets[var.account_id][var.aws_region]
  tags       = merge(local.shared_tags)
}
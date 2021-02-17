locals{
  security_group = var.security_groups_to_use != null ? flatten([module.securitygroup.security_group_id, var.security_groups_to_use]) : flatten([module.securitygroup.security_group_id])
}

resource "aws_rds_cluster" "aurora_cluster" {
    engine_mode                   = var.engine_mode
    engine                        = var.engine
    engine_version                = var.engine_version
    cluster_identifier            = "${var.teamid}-${var.prjid}"
    availability_zones            = var.availability_zones
    database_name                 = var.dbname
    master_username               = var.rds_master_username
    master_password               = var.rds_master_password
    backup_retention_period       = var.backup_retention_period
    preferred_backup_window       = var.preferred_backup_window
    preferred_maintenance_window  = var.maintenance_window
    db_subnet_group_name          = aws_db_subnet_group.default.name  
    vpc_security_group_ids        = local.security_group
    deletion_protection           = var.delete_protection
    port                          = var.service_ports
    skip_final_snapshot           = true
    # final_snapshot_identifier     = var.prjid  # Optional, if final snapshot is required
    # enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
    # scaling_configuration         = engine_mode ? 1 : 0
    # var.scaling_configuration

    tags                           = merge(local.shared_tags)

    lifecycle {
        create_before_destroy = true
    }

}

resource "aws_rds_cluster_instance" "writer" {
    engine                              = var.engine
    count                               = var.number_of_writer_instances
    identifier                          = "${var.prjid}-${count.index}"
    cluster_identifier                  = aws_rds_cluster.aurora_cluster.id #aws_rds_cluster.aurora_cluster.id
    instance_class                      = var.writer_instance_class
    db_subnet_group_name                = aws_db_subnet_group.default.name    #var.vpc_rds_subnet_ids
    publicly_accessible                 = var.is_public
    tags                                = merge(local.shared_tags)

    lifecycle {
        create_before_destroy = true
   }
}

resource "aws_db_subnet_group" "default" {
  name       = "${var.teamid}-${var.prjid}"
  subnet_ids = module.global.subnets[var.account_id][var.aws_region]
  tags       = merge(local.shared_tags)
}
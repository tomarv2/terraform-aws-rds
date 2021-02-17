module "rds" {
  source = "../../aurora_cluster"

  email                                 = var.email
  teamid                                = var.teamid
  prjid                                 = var.prjid
  profile_to_use                        = var.profile_to_use
  account_id                            = var.account_id

  availability_zones                    = var.availability_zones
  backup_retention_period               = var.backup_retention_period
  preferred_backup_window               = var.preferred_backup_window
  delete_protection                     = var.delete_protection
  dbname                                = var.dbname
  maintenance_window                    = var.maintenance_window
  public                                = var.public
  rds_master_password                   = var.rds_master_password
  rds_master_username                   = var.rds_master_username
  aws_region                            = var.aws_region
  skip_final_snapshot                   = var.skip_final_snapshot
  security_groups_to_use                = var.security_groups_to_use
}

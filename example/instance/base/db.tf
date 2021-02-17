module "rds" {
  source = "../../instance"

  email                                 = var.email
  teamid                                = var.teamid
  prjid                                 = var.prjid
  profile_to_use                        = var.profile_to_use
  account_id                            = var.account_id

  availability_zone                     = var.availability_zone
  backup_retention_period               = var.backup_retention_period
  preferred_backup_window               = var.preferred_backup_window
  dbname                                = var.dbname
  maintenance_window                    = var.maintenance_window
  public                                = var.public
  password                              = var.password
  username                              = var.username
  aws_region                            = var.aws_region
  skip_final_snapshot                   = var.skip_final_snapshot
  security_groups_to_use                = var.security_groups_to_use
}

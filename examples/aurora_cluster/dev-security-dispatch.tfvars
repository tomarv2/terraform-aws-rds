email                     = "varun.tomar@databricks.com"
profile_to_use            = "default"
identifier                = "devdispatch"
engine                    = "aurora-postgresql"
engine_version            = "9.6.16"
rds_master_username       = "devdispatch"
rds_master_password       = "xxxxxxxxxxxx"
maintenance_window        = "mon:10:35-mon:11:05"
backup_retention_period   = 1
preferred_backup_window   = "07:00-09:00"
public                    = "true"
vpc_rds_security_group_id = ["sg-0a5ebc129252a8f93"]
engine_mode               = "provisioned"
delete_protection         = false
writer_instance_class     = "db.r4.large"
availability_zones        = "us-east-2b"
region                    = "us-east-2"
skip_final_snapshot       = true
#-------------------------------------------------------------------
# Do not change the teamid, prjid once set.
teamid = "security"
prjid  = "dev-dispatch-rds"



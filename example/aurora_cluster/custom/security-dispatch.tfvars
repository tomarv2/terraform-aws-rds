email                               = "varun.tomar@databricks.com"       
profile_to_use                      = "default"
identifier                          = "proddispatch"
engine 		                        = "aurora-postgresql"
engine_version	                    = "9.6.16"
rds_master_username 	            = "proddispatch"
rds_master_password 	            = "xxxxxxxxxxxxx"
maintenance_window                  = "mon:10:35-mon:11:05"
backup_retention_period             = 3
preferred_backup_window             = "07:00-09:00"
public                              = "true"
vpc_rds_security_group_id           = ["sg-0724aa7f6d765a501"]
engine_mode                         = "provisioned"
subnet_ids                          = ["subnet-0ba8a3189c60bad08", "subnet-0db442203bdc8494e", "subnet-0c20cda7224789b06"]
delete_protection                   = false
writer_instance_class               = "db.r4.large"
availability_zones                  = "us-west-2b"
region                              = "us-west-2"
skip_final_snapshot                 = true
#-------------------------------------------------------------------
# Do not change the teamid, prjid once set.
teamid                              = "security"
prjid                               = "dispatch"



variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
}

variable "profile_to_use" {
  description = "profile to use from ~/.aws/config"
  default     = "default"
}

variable "username" {
  description = "Username for the master DB user"
}

variable "password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
}

variable "backup_retention_period" {
  description = "The days to retain backups for"
  default     = 1
}

variable "preferred_backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window"
  default     = "09:46-10:16"
}

variable "maintenance_window" {
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"
  default     = "Mon:00:00-Mon:03:00"
}

variable "engine_version" {
  default     = ""
  description = "The version number of the database engine to use"
}

variable "engine" {
  default     = "postgres"
  description = "Name of the database engine to be used for this DB cluster. Defaults to aurora [mysql, postgres]"
}

variable "instance_class" {
  default     = "db.t2.micro"
  description = "db instance class"
}

variable "dbname" {}

variable "name" {
  description = "The DB name to create. If omitted, no database is created initially"
  default     = ""
}

variable "availability_zone" {
  default = "us-west-2b"
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier"
  type        = bool
  default     = true
}

variable "aws_region" {
  description = "The AWS region to create resources"
  default     = "us-west-2"
}

variable "account_id" {
  description = "(Required) AWS account id (used to pull values from shared base module like vpc info, subnet ids)"
}

variable "service_ports" {
  default = "5432"
}

variable "security_groups_to_use" {
  description = "List of VPC security groups to associate"
  default     = []
}

variable "enabled_cloudwatch_logs_exports" {
  description = "List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL)."
  type        = list(string)
  default     = []
}

variable "delete_automated_backups" {
  description = "Specifies whether to remove automated backups immediately after the DB instance is deleted"
  type        = bool
  default     = true
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
  type        = bool
  default     = true
}

variable "allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible"
  type        = bool
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
  type        = bool
  default     = true
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group to associate"
  type        = string
  default     = ""
}

variable "storage_type" {
  description = "'standard' , 'gp2',  or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified"
  default     = "standard"
}

variable "allocated_storage" {
  description = "Specifies the value for Storage Autoscaling"
  type        = number
  default     = 20
}

variable "db_subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC"
  default     = ""
}

variable "deploy_rds" {
  description = "feature flag, true or false"
  default     = true
  type        = bool
}

variable "is_public" {
  description = "Bool to control if instance is publicly accessible"
  type        = bool
  default     = false
}

variable "max_allocated_storage" {
  description = "When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated_storage. Must be greater than or equal to allocated_storage or 0 to disable Storage Autoscaling."
  default     = 0
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60."
  type        = number
  default     = 0
}

variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted. Note that if you are creating a cross-region read replica this field is ignored and you should instead declare kms_key_id with a valid ARN. The default is false if not specified."
  default     = false
}
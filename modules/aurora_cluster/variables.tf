variable "teamid" {
  description = "Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
  type        = string
}

variable "prjid" {
  description = "Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
  type        = string
}


variable "rds_master_username" {
  description = "Username for the master DB user"
  type        = string
}

variable "rds_master_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
  type        = string
}

variable "backup_retention_period" {
  description = "The days to retain backups for"
  default     = 1
  type        = number
}

variable "preferred_backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window"
  default     = "09:46-10:16"
  type        = string
}

variable "maintenance_window" {
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"
  default     = "Mon:00:00-Mon:03:00"
  type        = string
}

variable "engine_mode" {
  description = "Engine"
  default     = "provisioned"
  type        = string
}

variable "engine_version" {
  type        = string
  default     = ""
  description = "The version number of the database engine to use"
}

variable "engine" {
  default     = "aurora"
  description = "Name of the database engine to be used for this DB cluster. Defaults to aurora [aurora, aurora-mysql, aurora-postgresql]"
  type        = string
}

variable "writer_instance_class" {
  default     = "db.t3.medium"
  description = "only needed when using aws_rds_cluster_instance = not `serverless`"
  type        = string
}

variable "dbname" {
  description = "DB name"
  type        = string
}

variable "number_of_writer_instances" {
  default     = 1
  description = "0 instance refer to `serverless` only works for mySQL, not supported for Postgres"
  type        = number
}

variable "is_public" {
  description = "RDS public"
  default     = "false"
  type        = string
}

variable "delete_protection" {
  description = "Delete protection"
  default     = "false"
  type        = string
}

variable "availability_zones" {
  description = "A list of EC2 Availability Zones for the DB cluster storage where DB cluster instances can be created. RDS automatically assigns 3 AZs if less than 3 AZs are configured, which will show as a difference requiring resource recreation next Terraform apply. It is recommended to specify 3 AZs or use the lifecycle configuration block ignore_changes argument if necessary."
  type        = list(any)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier"
  type        = bool
  default     = true
}

variable "service_ports" {
  description = "RDS service port"
  default     = "5432"
  type        = string
}

variable "security_groups" {
  description = "List of VPC security groups to associate"
  default     = []
  type        = list(any)
}

variable "final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB instance is deleted."
  type        = string
  default     = null
}

variable "deploy_rds_cluster" {
  description = "Feature flag, true or false"
  default     = true
  type        = bool
}

variable "enabled_cloudwatch_logs_exports" {
  description = "List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL)."
  type        = list(string)
  default     = []
}

variable "copy_tags_to_snapshot" {
  description = "Copy all Cluster tags to snapshots."
  default     = false
  type        = bool
}

variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted. Note that if you are creating a cross-region read replica this field is ignored and you should instead declare kms_key_id with a valid ARN. The default is false if not specified."
  default     = true
  type        = bool
}

variable "email" {
  description = "email address to be used for tagging (suggestion: use group email address)"
}

variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
}

variable "profile_to_use" {
  description = "profile to use from ~/.aws/config"
}

variable "username" {
}

variable "password" {
}

variable "backup_retention_period" {
  description = "backup retention period"
  default = 1
}

variable "preferred_backup_window" {
  description = "back up window"
  default = "07:00-09:00"
}

variable "maintenance_window" {
  description = "maintenance window"
  default = "mon:10:35-mon:11:05"
}

variable "engine_version" {
  type        = string
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

variable "public" {
  default = "true"
}

variable "availability_zone" {
  default = "us-west-2b"
}

//variable "multi_az" {
//  type = false
//}

variable "skip_final_snapshot"{
  default = true
}

variable "aws_region" {
  description = "The AWS region to create resources"
  default     = "us-west-2"
}

variable "account_id" {}

variable "service_ports" {
  default = "5432"
}

variable "security_groups_to_use" {
  description = "Security groups to use"
  default = []
}

variable "enabled_cloudwatch_logs_exports" {
  default = []
}

variable "delete_automated_backups" {
  default = true
}

variable "apply_immediately" {
  default = true
}

variable "allow_major_version_upgrade" {
  default = false
}

variable "parameter_group_name" {
  default = ""
}

variable "storage_type" {
  description = "'standard' , 'gp2',  or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified"
  default = "standard"
}

variable "allocated_storage" {
  default = 20
}

variable "storage_encrypted" {
  default = true
}

variable "db_subnet_group_name" {
  default = "default"
}
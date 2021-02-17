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

variable "rds_master_username" {}

variable "rds_master_password" {}

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

variable "engine_mode" {
  default = "provisioned"
}

variable "engine_version" {
  type        = string
  default     = ""
  description = "The version number of the database engine to use"
}

variable "engine" {
  default     = "aurora"
  description = "Name of the database engine to be used for this DB cluster. Defaults to aurora [aurora, aurora-mysql, aurora-postgresql]"
}

variable "writer_instance_class" {
  default     = "db.t3.medium"
  description = "only needed when using aws_rds_cluster_instance = not `serverless`"
}

variable "dbname" {}

variable "number_of_writer_instances" {
  default     = 1
  description = "0 instance refer to `serverless` only works for mySQL, not supported for Postgres"
}

variable "scaling_configuration" {
  type        = list
  default     = []
  description = "List of nested attributes with scaling properties. Only valid when engine_mode is set to `serverless`"
}

variable "public" {
  default = "true"
}

variable "delete_protection" {
  default = false
}

variable "availability_zones" {
  type = list
  default = ["us-west-2a", "us-west-2b"]
}

variable "aws_region" {
  default = "us-west-2"
}

variable "skip_final_snapshot"{
  default = true
}

variable "security_groups_to_use" {
  description = "Security groups to use"
  default = null
}

variable "account_id" {}

variable "service_ports" {
  default = 5432
}

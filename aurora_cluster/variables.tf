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

variable "rds_master_username" {
}

variable "rds_master_password" {
}

variable "backup_retention_period" {
  description = "backup retention period"
}

variable "preferred_backup_window" {
  description = "back up window"
}

variable "maintenance_window" {
  description = "maintenance window"
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

variable "is_public" {
  default = "false"
}

variable "delete_protection" {
  default = "true"
}

variable "availability_zones" {
  type = list
}

variable "skip_final_snapshot"{}

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
  description = "Security groups to use"
  default = []
}
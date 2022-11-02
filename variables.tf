variable "instance_config" {
  description = "RDS configuration"
  type        = map(any)
  default     = {}
}

variable "aurora_cluster_config" {
  description = "RDS cluster configuration"
  type        = map(any)
  default     = {}
}

variable "extra_tags" {
  description = "Additional tags to associate"
  type        = map(string)
  default     = {}
}

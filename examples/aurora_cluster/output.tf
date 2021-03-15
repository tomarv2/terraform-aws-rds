// aws_rds_cluster
output "rds_cluster_arn" {
  description = "The ID of the cluster"
  value       = module.rds.rds_cluster_arn
}

output "rds_cluster_id" {
  description = "The ID of the cluster"
  value       = module.rds.rds_cluster_id
}

output "rds_cluster_resource_id" {
  description = "The Resource ID of the cluster"
  value       = module.rds.rds_cluster_resource_id
}

output "rds_cluster_endpoint" {
  description = "The cluster endpoint"
  value       = module.rds.rds_cluster_endpoint
}

output "rds_cluster_reader_endpoint" {
  description = "The cluster reader endpoint"
  value       = module.rds.rds_cluster_reader_endpoint
}

output "rds_cluster_master_password" {
  description = "The master password"
  value       = module.rds.rds_cluster_master_password
  sensitive   = true
}

output "rds_cluster_port" {
  description = "The port"
  value       = module.rds.rds_cluster_port
}

output "rds_cluster_master_username" {
  description = "The master username"
  value       = module.rds.rds_cluster_master_username
}

output "rds_security_group" {
  value = module.security_group.security_group_id
}
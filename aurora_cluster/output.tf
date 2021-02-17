// aws_rds_cluster
output "rds_cluster_arn" {
  description = "The ARN of the cluster"
  value       = aws_rds_cluster.aurora_cluster.arn
}

output "rds_cluster_id" {
  description = "The ID of the cluster"
  value       = aws_rds_cluster.aurora_cluster.id
}

output "rds_cluster_resource_id" {
  description = "The Resource ID of the cluster"
  value       = aws_rds_cluster.aurora_cluster.cluster_resource_id
}

output "rds_cluster_endpoint" {
  description = "The cluster endpoint"
  value       = aws_rds_cluster.aurora_cluster.endpoint
}

output "rds_cluster_reader_endpoint" {
  description = "The cluster reader endpoint"
  value       = aws_rds_cluster.aurora_cluster.reader_endpoint
}

// database_name is not set on `aws_rds_cluster` resource if it was not specified, so can't be used in output
output "rds_cluster_database_name" {
  description = "Name for an automatically created database on cluster creation"
  value       = var.dbname
}

output "rds_cluster_master_password" {
  description = "The master password"
  value       = aws_rds_cluster.aurora_cluster.master_password
  sensitive   = true
}

output "rds_cluster_port" {
  description = "The port"
  value       = aws_rds_cluster.aurora_cluster.port
}

output "rds_cluster_master_username" {
  description = "The master username"
  value       = aws_rds_cluster.aurora_cluster.master_username
}

// aws_rds_cluster_instance
output "rds_cluster_instance_endpoints" {
  description = "A list of all cluster instance endpoints"
  value       = aws_rds_cluster_instance.writer.*.endpoint
}

output "rds_securitygroup" {
  value = module.securitygroup.security_group_id
}
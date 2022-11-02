# Instance
output "instance_arn" {
  description = "The ARN of the instance"
  value       = [for entry in aws_db_instance.this : entry.arn]
}

output "instance_id" {
  description = "The ID of the instance"
  value       = [for entry in aws_db_instance.this : entry.id]
}

output "instance_resource_id" {
  description = "The Resource ID of the instance"
  value       = [for entry in aws_db_instance.this : entry.resource_id]
}

output "instance_address" {
  description = "Instance address"
  value       = [for entry in aws_db_instance.this : entry.address]
}

output "instance_username" {
  description = "The username"
  value       = [for entry in aws_db_instance.this : entry.username]
}

output "instance_endpoint" {
  description = "Instance endpoint"
  value       = [for entry in aws_db_instance.this : entry.endpoint]
}

output "instance_name" {
  description = "Instance name"
  value       = [for entry in aws_db_instance.this : entry.name]
}

# Cluster
output "cluster_arn" {
  description = "Cluster arn"
  value       = [for entry in aws_rds_cluster.this : entry.arn]
}

output "cluster_id" {
  description = "Cluster id"
  value       = [for entry in aws_rds_cluster.this : entry.id]
}

output "cluster_resource_id" {
  description = "Cluster resource id"
  value       = [for entry in aws_rds_cluster.this : entry.cluster_resource_id]
}

output "cluster_identifier" {
  description = "Cluster identifier"
  value       = [for entry in aws_rds_cluster.this : entry.cluster_identifier]
}

output "cluster_endpoint" {
  description = "Cluster endpoint"
  value       = [for entry in aws_rds_cluster.this : entry.endpoint]
}

output "cluster_members" {
  description = "Cluster members"
  value       = [for entry in aws_rds_cluster.this : entry.cluster_members]
}

output "cluster_instance_endpoint" {
  description = "Cluster members"
  value       = [for entry in aws_rds_cluster_instance.this : entry.endpoint] # aws_rds_cluster_instance.this.*.endpoint#
}

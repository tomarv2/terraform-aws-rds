output "rds_cluster_arn" {
  description = "The ARN of the cluster"
  value       = join("", aws_rds_cluster.aurora_cluster.*.arn)
}

output "rds_cluster_id" {
  description = "The ID of the cluster"
  value       = join("", aws_rds_cluster.aurora_cluster.*.id)
}

output "rds_cluster_resource_id" {
  description = "The Resource ID of the cluster"
  value       = join("", aws_rds_cluster.aurora_cluster.*.cluster_resource_id)
}

output "rds_cluster_endpoint" {
  description = "The cluster endpoint"
  value       = join("", aws_rds_cluster.aurora_cluster.*.endpoint)
}

output "rds_cluster_reader_endpoint" {
  description = "The cluster reader endpoint"
  value       = join("", aws_rds_cluster.aurora_cluster.*.reader_endpoint)
}

output "rds_cluster_master_password" {
  description = "The master password"
  value       = join("", aws_rds_cluster.aurora_cluster.*.master_password)
}

output "rds_cluster_port" {
  description = "The port"
  value       = join("", aws_rds_cluster.aurora_cluster.*.port)
}

output "rds_cluster_master_username" {
  description = "The master username"
  value       = join("", aws_rds_cluster.aurora_cluster.*.master_username)
}

output "rds_cluster_instance_endpoints" {
  description = "A list of all cluster instance endpoints"
  value       = join("", aws_rds_cluster_instance.writer.*.endpoint)
}

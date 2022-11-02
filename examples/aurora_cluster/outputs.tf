# Cluster
output "cluster_arn" {
  description = "Cluster arn"
  value       = module.aurora_cluster.cluster_arn
}

output "cluster_id" {
  description = "Cluster id"
  value       = module.aurora_cluster.cluster_id
}

output "cluster_resource_id" {
  description = "Cluster resource id"
  value       = module.aurora_cluster.cluster_resource_id
}

output "cluster_identifier" {
  description = "Cluster identifier"
  value       = module.aurora_cluster.cluster_identifier
}

output "cluster_endpoint" {
  description = "Cluster endpoint"
  value       = module.aurora_cluster.cluster_endpoint
}

output "cluster_instance_endpoint" {
  value = module.aurora_cluster.cluster_instance_endpoint
}

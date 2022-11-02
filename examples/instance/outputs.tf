#Instance
output "instance_arn" {
  description = "The ID of the instance"
  value       = module.rds_instance.instance_arn
}

output "instance_id" {
  description = "The ID of the instance"
  value       = module.rds_instance.instance_id
}

output "instance_resource_id" {
  description = "The Resource ID of the instance"
  value       = module.rds_instance.instance_resource_id
}

output "instance_endpoint" {
  description = "RDS instance endpoint"
  value       = module.rds_instance.instance_endpoint
}

output "instance_username" {
  description = "RDS instance username"
  value       = module.rds_instance.instance_username
}

output "instance_name" {
  description = "RDS instance username"
  value       = module.rds_instance.instance_name
}

output "instance_arn" {
  description = "The ID of the instance"
  value       = module.rds.instance_arn
}

output "instance_id" {
  description = "The ID of the instance"
  value       = module.rds.instance_id
}

output "instance_resource_id" {
  description = "The Resource ID of the instance"
  value       = module.rds.instance_resource_id
}

output "instance_endpoint" {
  description = "The instance endpoint"
  value       = module.rds.instance_endpoint
}

output "instance_database_name" {
  description = "Name for an automatically created database on instance creation"
  value       = var.dbname
}

output "instance_port" {
  description = "The instance port"
  value       = module.rds.instance_port
}

output "instance_username" {
  description = "The instance username"
  value       = module.rds.instance_username
}

output "rds_securitygroup" {
  value = module.rds.rds_securitygroup
}
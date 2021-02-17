output "instance_arn" {
  description = "The ARN of the instance"
  value       = aws_db_instance.default.arn
}

output "instance_id" {
  description = "The ID of the instance"
  value       = aws_db_instance.default.id
}

output "instance_resource_id" {
  description = "The Resource ID of the instance"
  value       = aws_db_instance.default.resource_id
}

output "instance_address" {
  description = "Instance address"
  value       = aws_db_instance.default.address
}

output "instance_database_name" {
  description = "Name for an automatically created database on cluster creation"
  value       = var.dbname
}

output "instance_port" {
  description = "The port"
  value       = aws_db_instance.default.port
}

output "instance_username" {
  description = "The username"
  value       = aws_db_instance.default.username
}

output "instance_endpoint" {
  description = "Instance endpoint"
  value       = aws_db_instance.default.endpoint
}

output "rds_securitygroup" {
  value = aws_db_instance.default.security_group_names
}
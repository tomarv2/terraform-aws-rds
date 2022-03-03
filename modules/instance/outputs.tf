output "instance_arn" {
  description = "The ARN of the instance"
  value       = join("", aws_db_instance.default.*.arn)
}

output "instance_id" {
  description = "The ID of the instance"
  value       = join("", aws_db_instance.default.*.id)
}

output "instance_resource_id" {
  description = "The Resource ID of the instance"
  value       = join("", aws_db_instance.default.*.resource_id)
}

output "instance_address" {
  description = "Instance address"
  value       = join("", aws_db_instance.default.*.address)
}

output "engine_version" {
  description = "Engine version"
  value       = join("", aws_db_instance.default.*.engine_version)
}

output "instance_port" {
  description = "RDS cluster port"
  value       = join("", aws_db_instance.default.*.port)
}

output "instance_username" {
  description = "The username"
  value       = join("", aws_db_instance.default.*.username)
}

output "instance_endpoint" {
  description = "Instance endpoint"
  value       = join("", aws_db_instance.default.*.endpoint)
}

output "instance_name" {
  description = "Instance name"
  value       = join("", aws_db_instance.default.*.name)
}

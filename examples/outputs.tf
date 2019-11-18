output "id" {
  value       = module.sg.id
  description = "The ID of the security group."
}

output "arn" {
  value       = module.sg.arn
  description = "The ARN of the security group."
}

output "vpc_id" {
  value       = module.sg.vpc_id
  description = "The VPC ID of the security group."
}

output "name" {
  value       = module.sg.name
  description = "The name of the security group."
}

output "description" {
  value       = module.sg.description
  description = "The description of the security group."
}

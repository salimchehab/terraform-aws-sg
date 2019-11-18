output "id" {
  value       = concat(aws_security_group.this.*.id, [""])[0]
  description = "The ID of the security group."
}

output "arn" {
  value       = concat(aws_security_group.this.*.arn, [""])[0]
  description = "The ARN of the security group."
}

output "vpc_id" {
  value       = concat(aws_security_group.this.*.vpc_id, [""])[0]
  description = "The VPC ID of the security group."
}

output "name" {
  value       = concat(aws_security_group.this.*.name, [""])[0]
  description = "The name of the security group."
}

output "description" {
  value       = concat(aws_security_group.this.*.description, [""])[0]
  description = "The description of the security group."
}

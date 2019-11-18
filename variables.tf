variable "create_sg" {
  description = "Whether or not to create the security group."
  type        = bool
  default     = false
}

variable "vpc_id" {
  description = "The VPC ID for the security group."
  type        = string
}

variable "sg_name" {
  description = "The name of the security group."
  type        = string
}

variable "sg_tags" {
  description = "A map of tags for the security group."
  type        = map(string)
  default     = {}
}

variable "ingress_rules_cidr_blocks" {
  description = "A list of maps containing the ingress rules: from_port, to_port, and a cidr_block."
  type        = list(map(string))
  default     = []
}

variable "egress_rules_cidr_blocks" {
  description = "A list of maps containing the egress rules: from_port, to_port, and a cidr_block."
  type        = list(map(string))
  default     = []
}

variable "ingress_rules_source_sg_id" {
  description = "A list of maps containing the ingress rules: from_port, to_port, and a source_security_group_id."
  type        = list(map(string))
  default     = []
}

variable "egress_rules_source_sg_id" {
  description = "A list of maps containing the egress rules: from_port, to_port, and a source_security_group_id."
  type        = list(map(string))
  default     = []
}

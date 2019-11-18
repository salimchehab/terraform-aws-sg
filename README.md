# Summary

This is used to create a security group as well as the ingress and egress rules. Examples can be found [here](./examples).

# Create the AWS Security Group and the Rules

Supported rules for ingress and egress:

- IPv4 CIDR blocks
- IPv4 remote security group id

# Terraform Docs

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| create\_sg | Whether or not to create the security group. | bool | `"false"` | no |
| egress\_rules\_cidr\_blocks | A list of maps containing the egress rules: from_port, to_port, and a cidr_block. | list(map(string)) | `[]` | no |
| egress\_rules\_source\_sg\_id | A list of maps containing the egress rules: from_port, to_port, and a source_security_group_id. | list(map(string)) | `[]` | no |
| ingress\_rules\_cidr\_blocks | A list of maps containing the ingress rules: from_port, to_port, and a cidr_block. | list(map(string)) | `[]` | no |
| ingress\_rules\_source\_sg\_id | A list of maps containing the ingress rules: from_port, to_port, and a source_security_group_id. | list(map(string)) | `[]` | no |
| sg\_name | The name of the security group. | string | n/a | yes |
| sg\_tags | A map of tags for the security group. | map(string) | `{}` | no |
| vpc\_id | The VPC ID for the security group. | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the security group. |
| description | The description of the security group. |
| id | The ID of the security group. |
| name | The name of the security group. |
| vpc\_id | The VPC ID of the security group. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

terraform {
  # Allow any 0.12.x version of terraform
  required_version = ">= 0.12, < 0.13"
}

provider "aws" {
  region = "eu-central-1"
  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = data.aws_vpc.default.id
}

module "sg" {
  source    = "../"
  create_sg = true
  vpc_id    = data.aws_vpc.default.id
  sg_name   = "testing-sg-name"
  sg_tags = {
    "Environment" = "Testing",
    "Terraform"   = true
  }
  ingress_rules_cidr_blocks = [
    {
      from_port  = "80"
      to_port    = "80"
      cidr_block = "10.10.10.10/32"
    },
    {
      from_port   = "443"
      to_port     = "443"
      cidr_block  = "10.10.10.10/32"
      description = "Allow HTTPS from node1"
    },
    {
      from_port  = "389"
      to_port    = "389"
      protocol   = "udp"
      cidr_block = "10.10.10.10/32"
    },
  ]
  egress_rules_cidr_blocks = [
    {
      from_port  = "80"
      to_port    = "80"
      cidr_block = "10.10.10.11/32"
    },
    {
      from_port   = "443"
      to_port     = "443"
      cidr_block  = "10.10.10.11/32"
      description = "Allow HTTPS to node2"
    },
  ]
}

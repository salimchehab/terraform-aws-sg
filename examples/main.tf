terraform {
  # Allow any 0.12.x version of terraform
  required_version = ">= 0.12, < 0.13"
}

provider "aws" {
  region = "eu-central-1"
  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

module "sg" {
  source = "../"
}

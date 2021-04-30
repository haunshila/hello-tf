# Terraform version
# Optional configuration for the Terraform Engine.
terraform {
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "/Users/hauyadav/terraform-projects/shared.cred/cred"
  profile                 = "sandbox"
}

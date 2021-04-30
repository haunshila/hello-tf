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

resource "aws_s3_bucket" "bucket1" {
  bucket = "${data.aws_caller_identity.current.account_id}-bucket1"
}

resource "aws_s3_bucket" "bucket2" {
  bucket = "${data.aws_caller_identity.current.account_id}-bucket2"
  tags = {
    # Implicit dependency
    dependency = aws_s3_bucket.bucket1.arn
  }
}

resource "aws_s3_bucket" "bucket3" {
  bucket = "${data.aws_caller_identity.current.account_id}-bucket3"
  # Explicit dependency
  depends_on = [
    aws_s3_bucket.bucket2
  ]
}
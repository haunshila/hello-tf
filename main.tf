
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

resource "aws_s3_bucket" "bucket4" {
  bucket = var.bucket_name
}
resource "aws_s3_bucket" "bucket5" {
  bucket = "${local.aws_account}-bucket5"
}

# Count
# Creates Count number of resources
resource "aws_s3_bucket" "bucketX" {
  count = 2
  bucket = "${local.aws_account}-bucket${count.index+6}"
}

# for_each
# with map
locals {
  buckets = {
    bucket101 = "the-bucket101"
    bucket102 = "the-bucket102"
  }
}
resource "aws_s3_bucket" "bucketY" {
  for_each = local.buckets
  bucket = "${local.aws_account}-${each.value}"
}

# with list
locals {
  bucketsList = [
    "the-bucket-101",
    "the-bucket-102"
  ]
}
resource "aws_s3_bucket" "bucketZ" {
  for_each = toset(local.bucketsList)
  bucket = "${local.aws_account}-${each.key}"
}

# Iteration
# `for` loop

locals {
  i = ["one", "two", "three"]
  upper_list = [for item in local.i: upper(item)]
  upper_map = {for item in local.i: item => upper(item)}
}

output "loops" {
  value = local.upper_map
}

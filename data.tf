# Data Sources
# Objects NOT managed by TF

data "aws_caller_identity" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}
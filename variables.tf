locals {
  aws_account = "${data.aws_caller_identity.current.account_id}-${lower(data.aws_caller_identity.current.user_id)}"
}
variable "bucket_name" {
  type = string
  # default is optional
  #default = "my-bucket"
}
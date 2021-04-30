locals {
  aws_account = "${data.aws_caller_identity.current.account_id}-${lower(data.aws_caller_identity.current.user_id)}"
  n = [0, 1, 2, 3, 4, 5]
  evens = [ for i in local.n: i if i % 2 == 0]
  person = {
    name = "haunshila"
  }
}
variable "bucket_name" {
  type = string
  # default is optional
  #default = "my-bucket"
}

/*
output "greeting" {
  value = "Hello Terraform."
}
*/

output "aws_caller_info" {
  value = data.aws_caller_identity.current
}

output "aws_availability_zones" {
  value = data.aws_availability_zones.available
}

output "directive" {
  value = <<-EOT
    Directives can also iterate..
      %{ for number in local.evens }
      ${number} is even.
      %{ endfor }
  EOT
}

output "heredoc" {
  value = <<-EOT
    This is a `heredoc` with directives
      %{ if local.person.name == "" }
      Sorry, I don't know who performed this action.
      %{ else }
      Hi ${local.person.name}
      %{ endif }
  EOT
}
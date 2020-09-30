# starter for_each loop
locals {
  names = ["demo-example-1", "demo-example-2"]
}
resource "aws_security_group" "names" {
  for_each    = toset(local.names)

  name        = each.value # key and value is the same for sets
  description = each.value
}
output "security_groups" {
  value = aws_security_group.names
}

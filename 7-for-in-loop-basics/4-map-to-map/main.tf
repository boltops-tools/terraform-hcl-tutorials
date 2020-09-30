locals {
  map = {a = 1, b = 2, c = 3}
}
output "result" {
  value = {for k,v in local.map : k => v }
}

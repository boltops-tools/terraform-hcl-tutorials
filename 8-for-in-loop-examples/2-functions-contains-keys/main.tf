locals {
  list = [{a = 1}, {b = 2}, {a = 3}]
}
output "list" {
  value = [for m in local.list : m if contains(keys(m), "a") ]
}

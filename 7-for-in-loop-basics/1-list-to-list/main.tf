locals {
  list = ["a","b","c"]
}
output "list" {
  value = [for s in local.list : upper(s)]
}

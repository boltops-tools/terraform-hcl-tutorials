locals {
  list = ["a","b","c"]
}
output "result" {
  value = {for i in local.list : i }
}

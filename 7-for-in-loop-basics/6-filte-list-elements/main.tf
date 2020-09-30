locals {
  list = [1,2,3,4,5]
}
output "list" {
  value = [for i in local.list : i if i < 3]
}

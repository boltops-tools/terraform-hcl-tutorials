locals {
  list = [
    {a = 1, b = 5},
    {a = 2},
    {a = 3},
    {a = 4, b = 8},
  ]
}
output "list" {
  value = [for m in local.list : m if contains(keys(m), "b") ]
}

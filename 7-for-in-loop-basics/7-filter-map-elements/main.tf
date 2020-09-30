locals {
  list = [
    {a = 1, b = 5},
    {a = 2, b = 6},
    {a = 3, b = 7},
    {a = 4, b = 8},
  ]
}
output "list" {
  value = [for m in local.list : values(m) if m.b > 6 ]
}

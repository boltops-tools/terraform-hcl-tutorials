locals {
  map = {a = 1, b = 2, c = 3}
}
output "result1" {
  value = [for k,v in local.map : "${k}-${v}" ]
}
output "result2" {
  value = [for v in local.map : v ]
}

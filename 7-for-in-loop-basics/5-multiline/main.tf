locals {
  list = ["a","b","c"]
}
output "list" {
  value = [
    for s in local.list :
      upper(s)
  ]
}

locals {
  map = {a = 1, b = 2, c = 3}
}
output "map" {
  value = {
    for k,v in local.map :
      k => v
  }
}

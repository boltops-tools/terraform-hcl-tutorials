locals {
  list = [
    "mr bob",
    "mr kevin",
    "mr stuart",
    "ms anna",
    "ms april",
    "ms mia",
  ]
}
output "list" {
  value = {for s in local.list : substr(s, 0, 2) => s...}
}

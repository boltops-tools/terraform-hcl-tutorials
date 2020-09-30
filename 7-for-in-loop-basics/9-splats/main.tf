locals {
  minions = [{
    name: "bob"
  },{
    name: "kevin",
  },{
    name: "stuart"
  }]
}
output "minions" {
  value = local.minions[*].name
}
# splat is same as the for in expression below
# output "minions" {
#   value = [for minion in local.minions : minion.name ]
# }

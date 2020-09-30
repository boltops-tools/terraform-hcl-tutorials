locals {
  groups = {
    example0 = {
      description = "sg description 0"
      rules = [{
        description = "rule description 0",
      },{
        description = "rule description 1",
      }]
    },
    example1 = {
      description = "sg description 1"
      rules = [{
        description = "rule description 0",
      },{
        description = "rule description 1",
      }]
    }
  }
  rules = { for k,v in local.groups : k => v.rules }
}
output "groups" {
  value = local.groups
}
output "rules" {
  value = local.rules
}

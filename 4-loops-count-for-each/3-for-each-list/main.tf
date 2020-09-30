locals {
  minions = ["bob", "kevin", "stewart"]
}
resource "null_resource" "minions" {
  for_each = toset(local.minions)
  # for_each = local.minions # using this instead of toset(local.minions) produces an error
  triggers = {
    name = each.value
  }
}
output "minions" {
  value = null_resource.minions
}

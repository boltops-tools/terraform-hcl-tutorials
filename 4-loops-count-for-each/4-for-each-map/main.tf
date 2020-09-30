locals {
  heights = {
    bob     = "short"
    kevin   = "tall"
    stewart = "medium"
  }
}
resource "null_resource" "heights" {
  for_each = local.heights
  triggers = {
    name   = each.key
    height = each.value
  }
}
output "heights" {
  value = null_resource.heights
}

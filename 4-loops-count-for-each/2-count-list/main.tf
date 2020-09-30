locals {
  names = ["bob", "kevin", "stewart"]
}
resource "null_resource" "names" {
  count = length(local.names)
  triggers = {
    name = local.names[count.index]
  }
}
output "names" {
  value = null_resource.names
}

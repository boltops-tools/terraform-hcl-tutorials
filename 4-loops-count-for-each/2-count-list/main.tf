locals {
  names = ["bob", "kevin", "stewart"]
}
resource "null_resource" "names" {
  count = length(local.names) # 3
  triggers = {
    name = local.names[count.index]
  }
}
output "names" {
  value = null_resource.names
}

resource "null_resource" "simple" {
  count = 2
}
output "simple" {
  value = null_resource.simple
}

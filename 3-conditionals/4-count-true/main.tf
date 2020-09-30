variable "create1" {
  default = true
}
resource "random_pet" "pet1" {
  count = var.create1 ? 1 : 0
  length = 2
}
output "pet1" {
  value = random_pet.pet1
}

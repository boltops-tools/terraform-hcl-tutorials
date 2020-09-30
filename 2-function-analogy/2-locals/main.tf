locals {
  length = 2
}

resource "random_pet" "this" {
  length = local.length
}

output "pet" {
  value = random_pet.this
}

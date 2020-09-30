variable "length" {
  type    = number
  default = 2
}

resource "random_pet" "this" {
  length = var.length
}

output "pet" {
  value = random_pet.this
}

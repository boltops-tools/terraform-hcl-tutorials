# starter for_each loop
locals {
  names = ["demo-example-1", "demo-example-2"]
}
locals {
  ports = [80, 81]
}
resource "aws_security_group" "names" {
  for_each    = toset(local.names)

  name        = each.value # key and value is the same for sets
  description = each.value

  dynamic "ingress" {
    for_each = local.ports
    content {
      description = "description ${ingress.key}"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
output "security_groups" {
  value = aws_security_group.names
}

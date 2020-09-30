## Useful Dynamic Block with Attrs List
locals {
  rules = [{
    description = "description 0",
    port = 80,
    cidr_blocks = ["0.0.0.0/0"],
  },{
    description = "description 1",
    port = 81,
    cidr_blocks = ["10.0.0.0/16"],
  }]
}
resource "aws_security_group" "list" {
  name        = "demo-list"
  description = "demo-list"

  dynamic "ingress" {
    for_each = local.rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}
output "list" {
  value = aws_security_group.list
}

## Specify the iterator object name
locals {
  map = {
    "description 0" = {
      port = 80,
      cidr_blocks = ["0.0.0.0/0"],
    }
    "description 1" = {
      port = 81,
      cidr_blocks = ["10.0.0.0/16"],
    }
  }
}
resource "aws_security_group" "map" {
  name        = "demo-map-each"
  description = "demo-map-each"

  dynamic "ingress" {
    for_each = local.map
    # normally would be "ingress" here, but we're overriding the name
    iterator = each
    content {
      # now we use each. instead of ingress.
      description = each.key # IE: "description 0"
      from_port   = each.value.port
      to_port     = each.value.port
      protocol    = "tcp"
      cidr_blocks = each.value.cidr_blocks
    }
  }
}
output "map" {
  value = aws_security_group.map
}


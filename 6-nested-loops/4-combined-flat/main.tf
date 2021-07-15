locals {
  groups = {
    example0 = {
      description = "sg description 0"
    },
    example1 = {
      description = "sg description 1"
    }
  }

  rules = {
    example0 = [{
      description = "rule description 0"
      port = 80
      cidr_blocks = ["10.0.0.0/16"]
    },{
      description = "rule description 1"
      port = 81
      cidr_blocks = ["10.1.0.0/16"]
    }]
    # empty List does not remove rules
    example1 = []
    # example1 = [{
    #   description = "rule description 2"
    #   port = 80
    #   cidr_blocks = ["10.2.0.0/16"]
    # },{
    #   description = "rule description 3"
    #   port = 81
    #   cidr_blocks = ["10.3.0.0/16"]
    # }]
  }
}

resource "aws_security_group" "this" {
  for_each    = local.groups

  name        = each.key # top-level key is security group name
  description = each.value.description

  dynamic "ingress" {
    for_each = lookup(local.rules, each.key, null) == null ? [] : local.rules[each.key] # List of Maps with rule attributes
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}
output "security_groups" {
  value = aws_security_group.this
}

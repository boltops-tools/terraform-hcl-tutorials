variable "groups" {
  default = {
    example0 = {
      description = "sg description 0"
    },
    example1 = {
      description = "sg description 1"
    }
  }
}
variable "rules" {
  default = {
    example0 = [{
      description      = "rule description 0"
      to_port          = 80
      from_port        = 80
      cidr_blocks      = ["10.0.0.0/16"]
    },{
      description      = "rule description 1"
      to_port          = 80
      from_port        = 80
      cidr_blocks      = ["10.1.0.0/16"]
    }]
    example1 = [] # empty List removes rules
    # example1 = [{
    #   description      = "rule description 2"
    #   to_port          = 80
    #   from_port        = 80
    #   cidr_blocks      = ["10.2.0.0/16"]
    # },{
    #   description      = "rule description 3"
    #   to_port          = 80
    #   from_port        = 80
    #   cidr_blocks      = ["10.3.0.0/16"]
    # }]
  }
}
locals {
  rules = {
    for k,v in var.rules:
      k => [
        for i in v:
        merge({
          ipv6_cidr_blocks = null
          prefix_list_ids  = null
          security_groups  = null
          protocol         = "tcp"
          self             = null
        }, i)
      ]
  }
}
resource "aws_security_group" "this" {
  for_each    = var.groups

  name        = each.key # top-level key is security group name
  description = each.value.description

  ingress = contains(keys(local.rules), each.key) ? local.rules[each.key] : []  # List of Maps with rule attributes
}
output "rules" {
  value = local.rules
}

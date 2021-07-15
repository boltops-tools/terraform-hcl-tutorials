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
      description      = "rule description 0"
      to_port          = 80
      from_port        = 80
      protocol         = "tcp"
      cidr_blocks      = ["10.0.0.0/16"]
      ipv6_cidr_blocks = null
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },{
      description      = "rule description 1"
      to_port          = 80
      from_port        = 80
      protocol         = "tcp"
      cidr_blocks      = ["10.1.0.0/16"]
      ipv6_cidr_blocks = null
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }]
    # example1 = [] # empty List removes previous rules, uncomment this line and comment below to test
    # example1 = [{
    #   description      = "rule description 0"
    #   to_port          = 80
    #   from_port        = 80
    #   protocol         = "tcp"
    #   cidr_blocks      = ["10.2.0.0/16"]
    #   ipv6_cidr_blocks = null
    #   prefix_list_ids  = null
    #   security_groups  = null
    #   self             = null
    # },{
    #   description      = "rule description 1"
    #   to_port          = 80
    #   from_port        = 80
    #   protocol         = "tcp"
    #   cidr_blocks      = ["10.3.0.0/16"]
    #   ipv6_cidr_blocks = null
    #   prefix_list_ids  = null
    #   security_groups  = null
    #   self             = null
    # }]
  }
}
resource "aws_security_group" "this" {
  for_each    = local.groups

  name        = each.key # top-level key is security group name
  description = each.value.description

  ingress = lookup(local.rules, each.key, null) == null ? [] : local.rules[each.key]
}
output "security_groups" {
  value = aws_security_group.this
}

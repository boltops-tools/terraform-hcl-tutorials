# direct
resource "aws_security_group" "direct" {
  name        = "demo-direct"
  description = "demo-direct"

  ingress = [{
    description = "description 0"
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = null
    prefix_list_ids = null
    security_groups = null
    self = null
  },{
    description = "description 1"
    from_port   = "81"
    to_port     = "81"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = null
    prefix_list_ids = null
    security_groups = null
    self = null
  }]
}
output "direct" {
  value = aws_security_group.direct
}

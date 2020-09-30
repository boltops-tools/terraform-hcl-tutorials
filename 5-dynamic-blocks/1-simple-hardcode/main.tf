# simple hardcode
resource "aws_security_group" "simple" {
  name        = "demo-simple"
  description = "demo-simple"

  ingress {
    description = "description 0"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "description 1"
    from_port   = 81
    to_port     = 81
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
output "simple" {
  value = aws_security_group.simple
}

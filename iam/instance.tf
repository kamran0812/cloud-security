
resource "aws_instance" "example_instance" {
  ami                  = var.ami
  instance_type        = var.instance_type
  key_name             = var.key_name
  iam_instance_profile = aws_iam_role.operator_role.name
}


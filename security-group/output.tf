output "alb_security_group_id" {
  value = aws_security_group.alb_security_group.id
}

output "public_subnet_security_group_id" {
  value = aws_security_group.public_subnet_security_group.id
}
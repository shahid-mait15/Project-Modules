output "alb_security_group_id" {
  value = aws_security_group.alb_security_group.id
}

output "private_subnet_security_group_id" {
  value = aws_security_group.private_subnet_security_group.id
}

output "bastian_host_security_group_id" {
  value = aws_security_group.bastion_host_security_group.id
}



output "bastion_jump_host_az1_id" {value = aws_instance.bastion_az1[0].id}

output "bastion_jump_host_az2_id" {value = aws_instance.bastion_az2[0].id}

output "bastion_jump_host_az3_id" {value = aws_instance.bastion_az3[0].id}
#--------------------------------------------------------------------------------------------

output "bastion_jump_host_az1_public_ip" {value = aws_instance.bastion_az1[0].public_ip}

output "bastion_jump_host_az2_public_ip" {value = aws_instance.bastion_az2[0].public_ip}

output "bastion_jump_host_az3_public_ip" {value = aws_instance.bastion_az3[0].public_ip}

#--------------------------------------------------------------------------------------------


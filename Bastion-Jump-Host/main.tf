resource "aws_instance" "bastion_az1" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id =  var.public_subnet_az1_id
  count =1
  key_name = var.key_name
    security_groups = [var.bastian_host_security_group_id]

  
  tags = {
    Name = "Bastion-jump-host-az1"
  }
}

resource "aws_instance" "bastion_az2" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id =  var.public_subnet_az2_id
  count =1
  key_name = var.key_name
    security_groups = [var.bastian_host_security_group_id]

  
  tags = {
    Name = "Bastion-jump-host-az2"
  }
}

resource "aws_instance" "bastion_az3" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id =  var.public_subnet_az3_id
  count =1
  key_name = var.key_name
    security_groups = [var.bastian_host_security_group_id]

   
  tags = {
    Name = "Bastion-jump-host-az3"
  }
}

#Create a VPC
resource "aws_vpc" "gxi_vpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    enable_dns_hostnames = true
    
    tags = {
        Name = "${var.project_name}-vpc"
    }
}

#create internet gateway and attach it to VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.gxi_vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

#use data source to get all availability zone in region
data "aws_availability_zones" "available_zones" {}

#create public subnet az1
resource "aws_subnet" "public_subnet_az1" {
    vpc_id = aws_vpc.gxi_vpc.id
    cidr_block = var.public_subnet_az1_cidr
    availability_zone = data.aws_availability_zones.available_zones.names[0]
    map_public_ip_on_launch = true

    tags = {
      "Name" = "public_subnet_az1"
    }
  
}

#create public subnet az2
resource "aws_subnet" "public_subnet_az2" {
    vpc_id = aws_vpc.gxi_vpc.id
    cidr_block = var.public_subnet_az2_cidr
    availability_zone = data.aws_availability_zones.available_zones.names[1]
    map_public_ip_on_launch = true

    tags = {
      "Name" = "public_subnet_az2"
    }
  
}

#create public subnet az3
resource "aws_subnet" "public_subnet_az3" {
    vpc_id = aws_vpc.gxi_vpc.id
    cidr_block = var.public_subnet_az3_cidr
    availability_zone = data.aws_availability_zones.available_zones.names[2]
    map_public_ip_on_launch = true

    tags = {
      "Name" = "public_subnet_az3"
    }
  
}

#create public route table and add public route
resource "aws_route_table" "public_route_table"{
    vpc_id = aws_vpc.gxi_vpc.id

    route {
      gateway_id = aws_internet_gateway.igw.id
      cidr_block = "0.0.0.0/0"

    }


    tags = {
      "Name" = "public_route_table"
    }

}

#associate public subnet az1 to "public_route_table"
resource "aws_route_table_association" "public_subnet_az1_route_table_association" {
  subnet_id = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.public_route_table.id

}


#associate public subnet az2 to "public_route_table"
resource "aws_route_table_association" "public_subnet_az2_route_table_association" {
  subnet_id = aws_subnet.public_subnet_az2.id
  route_table_id = aws_route_table.public_route_table.id

}

#associate public subnet az3 to "public_route_table"
resource "aws_route_table_association" "public_subnet_az3_route_table_association" {
  subnet_id = aws_subnet.public_subnet_az3.id
  route_table_id = aws_route_table.public_route_table.id

}

#---------------------------------------------------------------------------------------
#create private app subnet az1
resource "aws_subnet" "private_app_subnet_az1" {
   vpc_id = aws_vpc.gxi_vpc.id
    cidr_block = var.private_app_subnet_az1_cidr
    availability_zone = data.aws_availability_zones.available_zones.names[0]
    map_public_ip_on_launch = false

    tags = {
      "Name" = "private_app_subnet_az1"
    }
}

#create private app subnet az2
resource "aws_subnet" "private_app_subnet_az2" {
   vpc_id = aws_vpc.gxi_vpc.id
    cidr_block = var.private_app_subnet_az2_cidr
    availability_zone = data.aws_availability_zones.available_zones.names[1]
    map_public_ip_on_launch = false

    tags = {
      "Name" = "private_app_subnet_az2"
    }
}

#create private app subnet az3
resource "aws_subnet" "private_app_subnet_az3" {
   vpc_id = aws_vpc.gxi_vpc.id
    cidr_block = var.private_app_subnet_az3_cidr
    availability_zone = data.aws_availability_zones.available_zones.names[2]
    map_public_ip_on_launch = false

    tags = {
      "Name" = "private_app_subnet_az3"
    }
}

#---------------------------------------------------------------------------------------
#create private data subnet az1
resource "aws_subnet" "private_data_subnet_az1" {
   vpc_id = aws_vpc.gxi_vpc.id
    cidr_block = var.private_data_subnet_az1_cidr
    availability_zone = data.aws_availability_zones.available_zones.names[0]
    map_public_ip_on_launch = false

    tags = {
      "Name" = "private_data_subnet_az1"
    }
}


#create private data subnet az2
resource "aws_subnet" "private_data_subnet_az2" {
   vpc_id = aws_vpc.gxi_vpc.id
    cidr_block = var.private_data_subnet_az2_cidr
    availability_zone = data.aws_availability_zones.available_zones.names[1]
    map_public_ip_on_launch = false

    tags = {
      "Name" = "private_data_subnet_az2"
    }
}

#create private data subnet az3
resource "aws_subnet" "private_data_subnet_az3" {
   vpc_id = aws_vpc.gxi_vpc.id
    cidr_block = var.private_data_subnet_az3_cidr
    availability_zone = data.aws_availability_zones.available_zones.names[2]
    map_public_ip_on_launch = false

    tags = {
      "Name" = "private_data_subnet_az3"
    }
}
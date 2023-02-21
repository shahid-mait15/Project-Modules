/*
#Create a private key which can be used to login to the webserver
resource "tls_private_key" "Web-Key" {
  algorithm = "RSA"
}

#Save public key attributes from the generated key
resource "aws_key_pair" "App-Instance-Key" {
  key_name   = "Web-key"
  public_key = tls_private_key.Web-Key.public_key_openssh
}

#Save the key to your local system
resource "local_file" "Web-Key" {
    content     = tls_private_key.Web-Key.private_key_pem 
    filename = "Web-Key.pem"
} 
*/
#=========================================================================================================

resource "aws_instance" "instance_az1" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id =  var.private_app_subnet_az1_id
  count =1
  key_name = var.key_name
    security_groups = [var.private_subnet_security_group_id]

   user_data = <<-EOF

       #!/bin/sh
       sudo yum install httpd  php git -y
       sudo systemctl restart httpd
       sudo systemctl enable httpd
       echo "<html><body><div style= background-color: blue><marquee><h1> Welcome to server 1 </h1></marquee></div></body></html>" > /var/www/html/index.html
       EOF

  tags = {
    Name = "web-server-az1"
  }
}

resource "aws_instance" "instance_az2" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id =  var.private_app_subnet_az2_id
  count =1
  key_name = var.key_name
    security_groups = [var.private_subnet_security_group_id]

   user_data = <<-EOF

       #!/bin/sh
       sudo yum install httpd  php git -y
       sudo systemctl restart httpd
       sudo systemctl enable httpd
       echo "<html><body><div style= background-color: red><marquee><h1> Welcome to server 2 </h1></marquee></div></body></html>" > /var/www/html/index.html
       EOF
 
  tags = {
    Name = "web-server-az2"
  }
}

resource "aws_instance" "instance_az3" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id =  var.private_app_subnet_az3_id
  count =1
  key_name = var.key_name
    security_groups = [var.private_subnet_security_group_id]

   user_data = <<-EOF
       
       #!/bin/sh
       sudo yum install httpd  php git -y
       sudo systemctl restart httpd
       sudo systemctl enable httpd
       echo "<html><body><div style= background-color: green><marquee><h1> Welcome to server 3 </h1></marquee></div></body></html>" > /var/www/html/index.html
       EOF


  tags = {
    Name = "web-server-az3"
  }
}
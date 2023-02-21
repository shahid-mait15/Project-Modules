#CREATING PR9IVATE KEY'
 resource "tls_private_key" "web-key" {
     algorithm = var.key-algorithm
     
 }

 #save public key
 resource "aws_key_pair" "App-Instance-Key" {
    key_name = var.key_name
      public_key = tls_private_key.web-key.public_key_openssh

}

#save the key to your local system
resource "local_file" "Web-Key" {
  content = tls_private_key.web-key.private_key_pem
  filename = var.privatekey-filename

}

resource "aws_security_group" "security_group" {
  name        = "allow_port_https_and_http"
  description = "Allow TLS inbound for Http and Https"
  vpc_id = "vpc-09a6ea13b6a3bde8f"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }
  
  tags = {
    Project    = "CLOD1003"
    Created_by = "Nishitha"   
  }
}


resource "aws_instance" "ec2_instance" {
  count         = var.ec2_instance ? var.instance_count : 0 
  ami           = "ami-05c13eab67c5d8861" 
  instance_type = "t2.micro" 
  vpc_security_group_ids= [var.security_group_id]

  tags = {
    Name = "TerraformExample-${count.index}"
    Project    = "CLOD1003"
    Created_by = "Nishitha"   
  }
}

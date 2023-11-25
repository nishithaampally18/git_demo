resource "aws_s3_bucket" "my_bucket" {
  bucket = "nishitha-bucket-18" 

  tags = {
    Project    = "CLOD1003"
    Created_by = "Nishitha"   
  }
}

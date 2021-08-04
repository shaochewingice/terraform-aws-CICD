resource "aws_s3_bucket" "terraform-state" {
  bucket = "shaochewingice-terraform-state-d3"
  acl    = "private"

  tags = {
    Name = "Terraform state"
  }
}


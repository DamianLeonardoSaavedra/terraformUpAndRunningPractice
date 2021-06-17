provider "aws" {
  region = "us-east-1"
}
# crea Bucket s3 para guardar archivo de estado

resource "aws_s3_bucket" "enve-dami-s3" {
    bucket = "enve-dami-s3"
 
    versioning {
      enabled = true
    }
 
    lifecycle {
      prevent_destroy = true
  }
  
  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  } 
 }
provider "aws" {
  region = "us-east-1"
}
# crea Bucket s3 para guardar archivo de estado

resource "aws_s3_bucket" "enve-dami-s3" {
    bucket = "enve-dami-s3"
 
    versioning {
      enabled = true
    }
    force_destroy = true

    lifecycle {
      prevent_destroy = false
  }
  
  # Habilita encriptacion del lado del servidor por default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  } 
 }
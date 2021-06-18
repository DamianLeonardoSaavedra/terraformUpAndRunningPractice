terraform {
  backend "s3" {
    bucket = "enve-dami-s3-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
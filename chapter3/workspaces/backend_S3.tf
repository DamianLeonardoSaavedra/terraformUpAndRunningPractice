terraform {
 backend "s3" {
 encrypt = true
 bucket = "enve-dami-s3"
 dynamodb_table = "enve-dami-dynamodb-state-lock"
 region = "us-east-1"
 key = "workspaces/terraform.tfstate"
 }
}
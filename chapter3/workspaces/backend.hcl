# backend.hcl
bucket         = "enve-dami-s3"
region         = "us-east-1"
dynamodb_table = "enve-dami-dynamodb-state-lock"
encrypt        = true
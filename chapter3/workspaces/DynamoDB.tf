# crea una tabla dynamodb para archivos de esstado terraform
resource "aws_dynamodb_table" "enve-dami-dynamodb-state-lock" {
  name = "enve-dami-dynamodb-state-lock"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}
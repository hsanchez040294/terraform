terraform {
  backend "s3" {
      bucket = "tfbackend35517"
      key = "networking/terraaform.tfstate"
      region = "us-east-2"

      dynamodb_table = "tfbacklocks35517"
      encrypt = true
  }
} 
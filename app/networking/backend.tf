terraform {
  backend "s3" {
      bucket = "tf-backend-locks97194"
      key = "networking/terraaform.tfstate"
      region = "us-east-2"

      dynamodb_table = "tf-backend-locks97194"
      encrypt = true
  }
} 

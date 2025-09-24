terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.13.0"
    }
  }
  backend "s3" {
    bucket         = "my-unique-remote-s3-bucket"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "my-unique-remote-dynamo-table"
    encrypt        = true
  }
}
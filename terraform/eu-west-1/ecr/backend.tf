provider "aws" {
  region = "eu-west-1"
}

terraform {
  required_version = ">= 1.8"

  backend "s3" {
    bucket         = "kiran-tfstate"
    key            = "eu-west-1/ecr/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "kiran-terraform-statelock"
  }
}


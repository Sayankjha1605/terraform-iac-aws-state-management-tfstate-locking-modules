terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.63.0"
    }
  }

    backend "s3" {
    bucket         = "terra-infra-iam"
    key            = "terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terra-db"
    encrypt        = true
  }
}

provider "aws" {
  region = "eu-north-1"
}

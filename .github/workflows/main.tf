terraform {
  required_version = ">= 1.5.0"
  backend "s3" {
    bucket         = "your-terraform-state-bucket-name"
    key            = "test-env/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "your-dynamodb-lock-table"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "jegan-cicd-pipeline-test-bucket-2026"
}

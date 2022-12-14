terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "twitter-jobs" {
  bucket = "twitter-jobs"
  tags = {
    Name = "Managed via Terraform"
  }
}

resource "aws_s3_bucket_acl" "twitter-jobs-acl" {
  bucket = aws_s3_bucket.twitter-jobs.id
  acl    = "private"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.5"
    }

    github = {
      source  = "integrations/github"
      version = "5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "github" {
}

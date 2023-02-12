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

data "aws_ami" "ec_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

}

# provider "github" {
# }


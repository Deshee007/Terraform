terraform {
  backend "s3" {
    bucket = "demo-deshee-s3"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }

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


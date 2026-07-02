terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket         = "amzn-github-zxc"
    key            = "ec2/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile = true
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "arun_essential" {
  ami           = "ami-06067086cf86c58e6"
  instance_type = "t3.micro"

  tags = {
    Name = "arun-essential"
  }
}

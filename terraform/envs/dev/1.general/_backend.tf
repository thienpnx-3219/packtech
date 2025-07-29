terraform {
  required_version = ">= 1.3.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.56.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "~> 0.5"
    }
    template = {
      source  = "hashicorp/template"
      version = "~> 2"
    }
  }
  backend "s3" {
    profile = "wakutan-dev"
    bucket  = "wakutan-dev-test"
    key     = "1.general/terraform.dev.tfstate"
    region  = "ap-northeast-1"
    # encrypt = true
    # kms_key_id     = ""
    # dynamodb_table = ""
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = var.region
  profile = "wakutan-dev"
  default_tags {
    tags = {
      System = var.project
      Env    = var.env
    }
  }
}

provider "aws" {
  alias   = "east"
  region  = "us-east-1"
  profile = "wakutan-dev"
  default_tags {
    tags = {
      Project = var.project
      Env     = var.env
    }
  }
}

data "aws_caller_identity" "current" {}

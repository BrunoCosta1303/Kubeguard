terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 4,0"
      }
    }
}

provider "aws" {
    profile = "${var.aws_profile}"
    region = "${var.aws_region}"
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "my-context"
}
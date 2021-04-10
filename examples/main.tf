terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.36.0"
    }
  }
}

variable "AWS_ACCESS_KEY_ID" {}

variable "AWS_SECRET_ACCESS_KEY" {}

provider "aws" {

  region     = "us-west-2"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY

}

module "cloud_init" {

  source = "github.com/holgerson97/terraform-cloud-init//module"

  root-ssh-key = "ssh-key"
  ansible-ssh-key = "root-key"

}

resource "aws_instance" "example" {

  ami                    = "ami-005e54dee72cc1d00"
  instance_type          = "t2.micro"

  user_data = module.cloud_init.user_data

}

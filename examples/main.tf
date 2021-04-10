terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.36.0"
    }
  }
}

provider "aws" {
  region     = "us-east-2"
  access_key = "xxxxxxxxxxxxxxxxxxxxxxxx"
  secret_key = "xxxxxxxxxxxxxxxxxxxxxxxx"
}


module "cloud_init" {

  source = "https://github.com/holgerson97/terraform-cloud-init//module"

  root-ssh-key = "ssh-key"
  ansible-ssh-key = "root-key"

}

resource "aws_instance" "example" {

  ami                    = "ami-0c55b159cbfafe1f0"
  instance_type          = "t2.micro"

  user_data = module.cloud_init.user_data

}

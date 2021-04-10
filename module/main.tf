terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

provider "random" {}

resource "random_password" "server-password" {

    length           = 25
    special          = true

}

data "template_file" "user-data" {

    template = file("${path.module}/templates/cloud_init.yml")

    vars = {

        root_ssh_key    = var.root-ssh-key
        ansible_ssh_key = var.ansible-ssh-key
        server_passwd   = random_password.server-password.result

    }
}
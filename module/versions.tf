terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = ">=3.1.0"
    }
    template = {
      source = "hashicorp/template"
      version = ">=2.2.0"
    }
  }
}
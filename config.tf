terraform {
  required_version  = ">=1.0.7"

  backend "remote" {}

  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

terraform {
    required_version= "~> 0.12.29"
}

provider "azurerm" {
  version = "=2.22.0"
  features {}
}

resource "random_string" "psk" {
  length = 128
  special = true
}

locals {
  prefix = var.prefix != "" ? var.prefix : "rk"
  location = var.location != "" ? var.location : "canadacentral"
  pre-shared-key = var.shared-key != "" ? var.shared-key : random_string.psk.result
}
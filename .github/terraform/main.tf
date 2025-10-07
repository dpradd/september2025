terraform {
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

variable "location" {}

resource "azurerm_resource_group" "demo" {
  name     = "rg-demo-${terraform.workspace}"
  location = var.location
}
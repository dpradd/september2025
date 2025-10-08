terraform {
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

variable "location" {}
variable "env" {}

resource "azurerm_resource_group" "rg" {
  name     = "rg-demo-${var.env}"
  location = var.location
}
terraform {
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

variable "location" {}
variable "env" {}
variable "sku_name" {
  default = "P1v2"
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-demo-${var.env}"
  location = var.location
}

resource "azurerm_service_plan" "webappplan" {
  name                = "dprwalabservice${var.env}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_name            = var.sku_name
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "webapp" {
  name                = "dprwalabweb${var.env}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.webappplan.location
  service_plan_id     = azurerm_service_plan.webappplan.id

  site_config {}
}
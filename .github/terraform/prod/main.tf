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

resource "azurerm_service_plan" "plan" {
  name                = "ghactionsplani"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "app" {
  name                = "dprgawebap${var.env}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    application_stack {
      node_version = "18-lts"
    }
  }

  app_settings = {
    WEBSITE_RUN_FROM_PACKAGE = "1"
  }
}

output "webapp_name" {
  value = azurerm_linux_web_app.app.name
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}
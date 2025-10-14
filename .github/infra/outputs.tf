output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "acr_name" {
  value = azurerm_container_registry.acr.name
}

output "resource_group" {
  value = azurerm_resource_group.rg.name
}

output "containerapps_env_id" {
  value = azurerm_container_app_environment.env.id
}

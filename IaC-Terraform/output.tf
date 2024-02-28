output "container_registry_id" {
  value = azurerm_container_registry.acr.id
}

output "app_service_plan_id" {
  value = azurerm_app_service_plan.plan.id
}

output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}

output "app_service_url" {
  value = azurerm_app_service.app_service.default_site_hostname
}

output "container_registry_login_server" {
  value = azurerm_container_registry.container_registry.login_server
}

output "postgresql_server_fqdn" {
  value = azurerm_postgresql_server.postgresql_server.fqdn
}

output "postgresql_database_name" {
  value = azurerm_postgresql_database.postgresql_database.name
}

output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.workspace.id
}

output "application_insights_instrumentation_key" {
  value = azurerm_application_insights.app_insights.instrumentation_key
  sensitive = true
}

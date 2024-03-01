output "storage_account_id" {
  value = azurerm_storage_account.storage_account.id
}

output "app_service_url" {
  value = azurerm_app_service.app_service.default_site_hostname
}

# Add more outputs as needed for each environment

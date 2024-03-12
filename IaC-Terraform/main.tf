terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

# Import keyvault

data "azurerm_key_vault_secret" "secret" {
  name         = var.my_secret
  key_vault_id = "/subscriptions/80ea84e8-afce-4851-928a-9e2219724c69/resourceGroups/1-84d7c8f9-playground-sandbox/providers/Microsoft.KeyVault/vaults/mysdkeyvault"
}


# App Service Plan
resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}

# App Service
resource "azurerm_app_service" "app_service" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  site_config {
    linux_fx_version = "DOCKER|devopsskd/react-and-spring-data-rest:latest"
  }
}

# Container Registry
resource "azurerm_container_registry" "container_registry" {
  name                = var.container_registry_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic"
}

# PostgreSQL Server
resource "azurerm_postgresql_flexible_server" "postgresql_server" {
  name                         = var.postgresql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12"
  administrator_login          = "psqladmin"
  administrator_password = data.azurerm_key_vault_secret.secret.value
  storage_mb = 32768
  sku_name = "GP_Standard_D4s_v3"
 
}

# PostgreSQL Database
resource "azurerm_postgresql_flexible_server_database" "postgresql_database" {
  name                = var.postgresql_database_name
  resource_group_name = var.resource_group_name
  server_name         = var.postgresql_server_name
  charset             = "UTF8"
  collation           = "en_US.UTF8"
  depends_on          = [azurerm_postgresql_flexible_server.postgresql_server]

}

resource "azurerm_postgresql_flexible_server_firewall_rule" "firewall_rule" {
  name                = "office"
  resource_group_name = var.resource_group_name
  server_name         = var.postgresql_server_name
  start_ip_address    = "95.98.135.169"
  end_ip_address      = "95.98.135.169"
  depends_on          = [azurerm_postgresql_flexible_server.postgresql_server]
}

resource "azurerm_log_analytics_workspace" "workspace" {
  name                = var.analytics_workspace
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  daily_quota_gb      = 2
}

# Application Insights
resource "azurerm_application_insights" "app_insights" {
  name                = var.app_insights_name
  resource_group_name = var.resource_group_name
  location            = var.location
  workspace_id        = azurerm_log_analytics_workspace.workspace.id
  application_type    = "web"
  retention_in_days   = 30
}

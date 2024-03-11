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
resource "azurerm_postgresql_server" "postgresql_server" {
  name                         = var.postgresql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  sku_name                     = "B_Gen5_2"
  storage_mb                   = 5120
  administrator_login          = "psqladmin"
  administrator_login_password = "H@Sh1CoR3!"
  version                      = "9.5"
  ssl_enforcement_enabled      = true
}

# PostgreSQL Database
resource "azurerm_postgresql_database" "postgresql_database" {
  name                = var.postgresql_database_name
  resource_group_name = var.resource_group_name
  server_name         = var.postgresql_server_name
  charset             = "UTF8"
  collation           = "en_US.UTF8"

}

resource "azurerm_postgresql_firewall_rule" "firewall_rule" {
  name                = "office"
  resource_group_name = var.resource_group_name
  server_name         = var.postgresql_server_name
  start_ip_address    = "95.98.135.169"
  end_ip_address      = "95.98.135.169"
}

resource "azurerm_log_analytics_workspace" "workspace" {
  name                = var.analytics_workspace
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# Application Insights
resource "azurerm_application_insights" "app_insights" {
  name                = var.app_insights_name
  resource_group_name = var.resource_group_name
  location            = var.location
  workspace_id        = azurerm_log_analytics_workspace.workspace.id
  application_type    = "web"
}

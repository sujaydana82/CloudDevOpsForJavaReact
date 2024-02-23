provider "azurerm" {
  features {}
  skip_provider_registration = true
}

variable "image_tag" {
  description = "The tag of the Docker image"
  type        = string
  default     = "latest"
}

resource "azurerm_resource_group" "rg" {
  name     = "1-23dc4895-playground-sandbox"
  location = "East US"
}

resource "azurerm_container_registry" "acr" {
  name                     = "skdContainerRegistry"
  resource_group_name      = "1-23dc4895-playground-sandbox"
  location                 = "East US"
  sku                      = "Basic"
  admin_enabled            = true
}

resource "azurerm_service_plan" "plan" {
  name                = "skdAppServicePlan"
  location            = "East US"
  resource_group_name = "1-23dc4895-playground-sandbox"
  sku_name            = "S1"
  os_type  = "Linux"
}

resource "azurerm_app_service" "app" {
  name                = "skdAppService"
  location            = "East US"
  resource_group_name = "1-23dc4895-playground-sandbox"
  app_service_plan_id = azurerm_service_plan.plan.id
  https_only          = true

  site_config {
    linux_fx_version = "DOCKER|${azurerm_container_registry.acr.login_server}/myapp:${var.image_tag}"
    always_on        = true
  }

  app_settings = {
    "DOCKER_REGISTRY_SERVER_URL" = "https://${azurerm_container_registry.acr.login_server}"
    "DOCKER_REGISTRY_SERVER_USERNAME" = azurerm_container_registry.acr.admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD" = azurerm_container_registry.acr.admin_password
  }
}

resource "azurerm_mssql_server" "example" {
  name                         = "skd-sqlserver"
  resource_group_name          = "1-23dc4895-playground-sandbox"
  location                     = "East US"
  version                      = "12.0"
  administrator_login          = "adminuser"
  administrator_login_password = "Password1234!"
}

resource "azurerm_mssql_database" "example" {
  name       = "skd-sqldb"
  server_id  = azurerm_mssql_server.example.id
}
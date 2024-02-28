provider "azurerm" {
  features {}
  skip_provider_registration = true
}

variable "image_tag" {
  description = "The tag of the Docker image"
  type        = string
  default     = "latest"
}
//resource "azurerm_resource_group" "rg" {
  //name     = var.resource_group_name
  //location = var.location
//}

resource "azurerm_container_registry" "acr" {
  name                     = "skdContainerRegistry"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sku                      = "Basic"
  admin_enabled            = true
}

resource "azurerm_service_plan" "plan" {
  name                = "skdAppServicePlan"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "S1"
  os_type  = "Linux"
}

resource "azurerm_app_service" "app" {
  name                = "skdAppService"
  location            = var.location
  resource_group_name = var.resource_group_name
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
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "adminuser"
  administrator_login_password = var.admin_password
}

resource "azurerm_mssql_database" "example" {
  name       = "skd-sqldb"
  server_id  = azurerm_mssql_server.example.id
}

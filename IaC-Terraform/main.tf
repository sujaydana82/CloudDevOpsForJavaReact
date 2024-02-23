provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "1-23dc4895-playground-sandbox"
  location = "West Europe"
}

resource "azurerm_container_registry" "acr" {
  name                     = "skdContainerRegistry"
  resource_group_name      = "1-23dc4895-playground-sandbox"
  location                 = "West Europe"
  sku                      = "Basic"
  admin_enabled            = true
}

resource "azurerm_service_plan" "plan" {
  name                = "skdAppServicePlan"
  location            = "West Europe"
  resource_group_name = "1-23dc4895-playground-sandbox"
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "app" {
  name                = "skdAppService"
  location            = "West Europe"
  resource_group_name = "1-23dc4895-playground-sandbox"
  app_service_plan_id = azurerm_app_service_plan.plan.id
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

resource "azurerm_sql_server" "example" {
  name                         = "skd-sqlserver"
  resource_group_name          = "1-23dc4895-playground-sandbox"
  location                     = "West Europe"
  version                      = "12.0"
  administrator_login          = "adminuser"
  administrator_login_password = "Password1234!"
}

resource "azurerm_sql_database" "example" {
  name                = "skd-sqldb"
  resource_group_name = "1-23dc4895-playground-sandbox"
  location            = "West Europe"
  server_name         = "skd-sqlserver"
}

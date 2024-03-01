resource "azurerm_application_insights" "example" {
  name                = var.application_insights_name
  resource_group_name = var.resource_group_name
  location            = var.location
}

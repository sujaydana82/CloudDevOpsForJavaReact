variable "resource_group_name" {
  type    = string
  default = "<resource group name>"
}

variable "location" {
  type    = string
  default = "<region>"
}

variable "backendkey" {
  type    = string
  default = "<storage account key>"
}

variable "my_secret" {
  description = "My secret from Key Vault"
}

variable "app_service_name" {
  type    = string
  default = "<appservice name>"
}

variable "app_service_plan_name" {
  type    = string
  default = "<appserviceplan name>"
}

variable "container_registry_name" {
  type    = string
  default = "<container registry name>"
}

variable "postgresql_server_name" {
  type    = string
  default = "<dbserver name>"
}

variable "postgresql_database_name" {
  type    = string
  default = "<database name>"
}

variable "analytics_workspace" {
  type    = string
  default = "<analytics workspace name>"
}
  
variable "app_insights_name" {
  type    = string
  default = "<appinsights name>"
}

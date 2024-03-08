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

variable "sql_server_name" {
  type    = string
  default = "<dbserver name>"
}

variable "sql_database_name" {
  type    = string
  default = "<database name>"
}

variable "virtual_network_name" {
  type        = string
  description = "<virtual network name>"
}

variable "vnet_name" {
  type        = string
  description = "<vnet name>"
}

variable "nsg_name" {
  type        = string
  description = "<nsg name>"
}

variable "source_ip" {
  type        = string
  description = "<source ip>"
}

variable "sql_server_vnet_rule_name" {
  type        = string
  description = "<sql server vnet rule name>"
}

variable "app_insights_name" {
  type    = string
  default = "<appinsights name>"
}

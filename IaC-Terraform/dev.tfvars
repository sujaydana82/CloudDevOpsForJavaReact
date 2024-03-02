variable "resource_group_name" {
  type    = string
  default = "1-a7b1fb6b-playground-sandbox"
}

variable "location" {
  type    = string
  default = "East US"
}

variable "storage_account_name" {
  type    = string
  default = "skdstorageaccount"
}

variable "container_name" {
  type    = string
  default = "skdcontainer"
}

variable "app_service_name" {
  type    = string
  default = "skdappservice"
}

variable "app_service_plan_name" {
  type    = string
  default = "skdappserviceplan"
}

variable "container_registry_name" {
  type    = string
  default = "skdcontainerregistry"
}

variable "sql_server_name" {
  type    = string
  default = "skddbserver"
}

variable "sql_database_name" {
  type    = string
  default = "skddatabase"
}

variable "app_insights_name" {
  type    = string
  default = "skdappinsights"
}

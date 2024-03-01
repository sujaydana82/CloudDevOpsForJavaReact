variable "resource_group_name" {
  type    = string
  default = "myresourcegroup"
}

variable "location" {
  type    = string
  default = "East US"
}

variable "storage_account_name" {
  type    = string
  default = "mystorageaccount"
}

variable "container_name" {
  type    = string
  default = "mycontainer"
}

variable "app_service_name" {
  type    = string
  default = "myappservice"
}

variable "app_service_plan_name" {
  type    = string
  default = "myappserviceplan"
}

variable "container_registry_name" {
  type    = string
  default = "mycontainerregistry"
}

variable "sql_server_name" {
  type    = string
  default = "mydbserver"
}

variable "sql_database_name" {
  type    = string
  default = "mydatabase"
}

variable "app_insights_name" {
  type    = string
  default = "myappinsights"
}

variable "resource_group_name" {
  description = "The name of the Azure resource group"
  type        = string
  # Replace 'your_resource_group_name' with the desired resource group name
  default     = "1-de8f2c04-playground-sandbox"
}

variable "location" {
  description = "The location for Azure resources"
  type        = string
  # Replace 'your_location' with the desired location (e.g., East US, West Europe)
  default     = "South Central US"
}

variable "sku_name" {
  description = "The SKU name for the service plan"
  type        = string
  # Replace 'your_sku_name' with the desired SKU name (e.g., S1, P1)
  default     = "S1"
}
variable "admin_username" {
  description = "The admin username for the Azure resources"
  type        = string
  #Replace 'your_admin_username' with the desired admin username
  default     = "adminuser"
}

variable "admin_password" {
  description = "The admin password for the Azure resources"
  type        = string
  #Replace 'your_admin_password' with the desired admin password
  default     = "Password1234!"
}

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
# Dev Env variables

variable "storage_account_name_dev" {
  description = "The name of the dev storage account"
  type        = string
  # Replace 'your_storage_account' with the desired storage account name
  default     = "skdstorageaccountdev"
}

variable "container_name_dev" {
  description = "The name of the dev container"
  type        = string
  # Replace 'your_container' with the desired container name
  default     = "skdscontainerdev"
}

# Acc Env variables

variable "storage_account_name_acc" {
  description = "The name of the acc storage account"
  type        = string
  # Replace 'your_storage_account' with the desired storage account name
  default     = "skdstorageaccountacc"
}

variable "container_name_acc" {
  description = "The name of the acc container"
  type        = string
  # Replace 'your_container' with the desired container name
  default     = "skdscontaineracc"
}

# Prd Env variables

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  # Replace 'your_storage_account' with the desired storage account name
  default     = "skdstorageaccount"
}

variable "container_name" {
  description = "The name of the storage account"
  type        = string
  # Replace 'your_container' with the desired container name
  default     = "skdscontainer"
}



# login to Azure
az login


# Variables
$subscriptionID = "your_subscription_id"
$resourceGroupName="1your_resource_group_name"
$storageAccountName="your_storage_account_name"
$location = "your_location"
$containerName = "your_container_name"

# Set the default subscription (if you have multiple subscriptions)
az account set --subscription $subscriptionID


# Create a storage account
az storage account create --name $storageAccountName --resource-group $resourceGroupName --location $location --sku Standard_LRS

# Get the storage account key
$storageAccountKey = $(az storage account keys list --resource-group $resourceGroupName --account-name $storageAccountName --query "[0].value" --output tsv)

# Create a container within the storage account
az storage container create --name $containerName --account-name $storageAccountName --account-key $storageAccountKey

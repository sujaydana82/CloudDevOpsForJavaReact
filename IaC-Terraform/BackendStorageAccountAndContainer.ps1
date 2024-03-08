# login to Azure
az login


# Variables
$subscriptionID = "0cfe2870-d256-4119-b0a3-16293ac11bdc"
$resourceGroupName="1-931f7868-playground-sandbox"
$storageAccountName="skdstorageaccount"
$location = "eastus"
$containerName = "skdcontainer"

# Set the default subscription (if you have multiple subscriptions)
az account set --subscription $subscriptionID


# Create a storage account
az storage account create --name $storageAccountName --resource-group $resourceGroupName --location $location --sku Standard_LRS

# Get the storage account key
$storageAccountKey = $(az storage account keys list --resource-group $resourceGroupName --account-name $storageAccountName --query "[0].value" --output tsv)

# Create a container within the storage account
az storage container create --name $containerName --account-name $storageAccountName --account-key $storageAccountKey

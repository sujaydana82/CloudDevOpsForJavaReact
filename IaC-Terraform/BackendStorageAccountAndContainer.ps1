# login to Azure
az login


# Variables
$subscriptionID = "80ea84e8-afce-4851-928a-9e2219724c69"
$resourceGroupName="1-ee9043e9-playground-sandbox"
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

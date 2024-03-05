#Login to azure
az login

#Variables
$subscriptionID = "80ea84e8-afce-4851-928a-9e2219724c69"
$resourceGroupName="1-a339fb94-playground-sandbox"
$keyvault = "skdkeyvault"
$location = "eastus"
$serviceprincipalID = "25b9da33-90dc-4535-92b0-1faaebace493"


# Set the default subscription (if you have multiple subscriptions)
az account set --subscription $subscriptionID

#Create a Key Vault
az keyvault create --name $keyvault --resource-group $resourceGroupName --location $location


# Assign permissions to the Key Vault for the Terraform service principal
az keyvault set-policy --name $keyvault --object-id $serviceprincipalID --secret-permissions get list

#Add Secrets to Key Vault: 

az keyvault secret set --vault-name $keyvault --name "SqlServer-Admin-Login" --value "skdsqladmin"
az keyvault secret set --vault-name $keyvault --name "SqlServer-Admin-Password" --value "skdsqlP@ssw0rd!"
az keyvault secret set --vault-name $keyvault --name "ContainerRegistry-Admin-Username" --value "skdcradmin"
az keyvault secret set --vault-name $keyvault --name "ContainerRegistry-Admin-Password" --value "skdcrP@ssw0rd!"
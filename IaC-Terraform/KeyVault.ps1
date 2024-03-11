#Login to azure
az login

#Variables
$subscriptionID = "2213e8b1-dbc7-4d54-8aff-b5e315df5e5b"
$resourceGroupName="1-fb6c20c4-playground-sandbox"
$keyvault = "myskdkeyvault"
$location = "South Central US"
$serviceprincipalID = "b87108ae-e983-439b-b02d-ad6a8881562e"


# Set the default subscription (if you have multiple subscriptions)
az account set --subscription $subscriptionID

#Create a Key Vault
az keyvault create --name $keyvault --resource-group $resourceGroupName --location $location


# Assign permissions to the Key Vault for the Terraform service principal
az keyvault set-policy --name $keyvault --object-id $serviceprincipalID --secret-permissions get list

#Add Secrets to Key Vault: 

az keyvault secret set --vault-name $keyvault --name "psqladmin-Login" --value "psqladmin"
az keyvault secret set --vault-name $keyvault --name "psqladmin-Password" --value "H@Sh1CoR3!"

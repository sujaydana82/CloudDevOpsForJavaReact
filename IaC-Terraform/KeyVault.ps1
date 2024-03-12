#Login to azure

az login


#Variables
$subscriptionID = "your_subscription_id"
$resourceGroupName="your_resource_group_name"
$keyvault = "your_key_vault"
$location = "your_location"
$serviceprincipalID = "your_service_principal_id"


# Set the default subscription (if you have multiple subscriptions)
az account set --subscription $subscriptionID

#Create a Key Vault
az keyvault create --name $keyvault --resource-group $resourceGroupName --location $location


# Assign permissions to the Key Vault for the Terraform service principal
az keyvault set-policy --name $keyvault --object-id $serviceprincipalID --secret-permissions get list

#Add Secrets to Key Vault: 

az keyvault secret set --vault-name $keyvault --name "adminLogin" --value "psqladmin"
az keyvault secret set --vault-name $keyvault --name "adminPassword" --value "yourPassword"

az keyvault secret set --vault-name $keyvault  --name JDBC-CS --value "jdbc:postgresql://myskddbserver.postgres.database.azure.com:5432/myskddatabase?user=psqladmin@{yourservername}&password=H@Sh1CoR3!&sslmode=require"





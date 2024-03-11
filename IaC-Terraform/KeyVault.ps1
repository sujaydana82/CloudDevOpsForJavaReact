#Login to azure

az login


#Variables
$subscriptionID = "80ea84e8-afce-4851-928a-9e2219724c69"
$resourceGroupName="1-f1361ab8-playground-sandbox"
$keyvault = "myskdkeyvault"
$location = "West US"
$serviceprincipalID = "a1855005-a6ca-460b-985b-afde1703b13d"


# Set the default subscription (if you have multiple subscriptions)
az account set --subscription $subscriptionID

#Create a Key Vault
az keyvault create --name $keyvault --resource-group $resourceGroupName --location $location


# Assign permissions to the Key Vault for the Terraform service principal
az keyvault set-policy --name $keyvault --object-id $serviceprincipalID --secret-permissions get list

#Add Secrets to Key Vault: 

az keyvault secret set --vault-name $keyvault --name "psqladmin-Login" --value "psqladmin"
az keyvault secret set --vault-name $keyvault --name "psqladmin-Password" --value "H@Sh1CoR3!"

az keyvault secret set --vault-name $keyvault  --name JDBC-CS --value "jdbc:postgresql://myskddbserver.postgres.database.azure.com:5432/myskddatabase?user=psqladmin@myskddbserver&password=H@Sh1CoR3!&sslmode=require"





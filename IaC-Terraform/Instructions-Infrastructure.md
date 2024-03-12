✨ Forking the Repository
- Go to the GitHub repository of the solution: GitHub Repository.
- Click on the "Fork" button in the top-right corner to create a copy of the repository in your GitHub account.

✨ Install azure cli on local machine


✨ Login to azure cloud with your login and in your existing desired subscription in existing resource group create a storage account and a container to save terraform.state file. Storage account and container can be created through script \IaC-Terraform\BackendStorageAccountAndContainer.ps1


✨ Create a keyvault for storing postgresql administrator credentials and connection string.


✨ Create configuration filess for Terraform, including main.tf, variables.tf, dev.tvars (for the development environment), and output.tf.

✨ Create a folder name IaC-Terraform inside in azure repo "CloudDevOpsForJavaReact"


✨ Create azure-pipeline and cleanup-pipeline 


✨  azure-pipeline will create 8 azure resources (app service plan, app service, container registry, workspace, application insights, postgresql flexible server, postgresql flexible database, postgresql firewall rule)


✨  After pipeline is deployed, Terraform.state file will be saved in storageaccount/container


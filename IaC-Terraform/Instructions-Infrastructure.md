Install Terraform on local machine

```
This function installs Terraform on the local machine.

```markdown
Install azure cli on local machine

```
This function installs the Azure CLI on the local machine.

```markdown
Login to azure cloud with your login and in your existing desired subscription in existing resource group create a storage account and a container to save terraform.state file. Storage account and container can be created through script \IaC-Terraform\BackendStorageAccountAndContainer.ps1

```
This function logs in to Azure using the Azure CLI and creates a storage account and container for Terraform state files.

```markdown
Create a keyvault for storing postgresql administrator credentials and connection string.

```
This function creates a Key Vault for storing PostgreSQL administrator credentials and connection strings.

```markdown
Create configuration files, main.tf, variables.tf,dev.tvars(for dev env), output.tf

```
This function creates the configuration files for Terraform, including main.tf, variables.tf, dev.tvars (for the development environment), and output.tf.

```markdown
Create a folder name IaC-Terraform inside in azure repo "CloudDevOpsForJavaReact"

```
This function creates a folder named IaC-Terraform inside the Azure repo CloudDevOpsForJavaReact.

```markdown
Create azure-pipeline and cleanup-pipeline 

```
This function creates two Azure Pipelines, azure-pipeline and cleanup-pipeline.

```markdown
azure-pipeline will create 8 azure resources (app service plan, app service, container registry, workspace, application insights, postgresql flexible server, postgresql flexible database, postgresql firewall rule)

```
after pipeline is deployed , Terraform.state file will be saved in storageaccount/container


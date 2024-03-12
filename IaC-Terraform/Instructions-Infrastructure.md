✨ Forking the Repository
- Go to the GitHub repository of the solution: [GitHub Repository](https://github.com/sujaydana82/CloudDevOpsForJavaReact).
- Click on the "Fork" button in the top-right corner to create a copy of the repository in your GitHub account.

✨ Install azure cli on local machine


✨ Login to azure cloud with your login and in your existing desired subscription in existing resource group create a storage account and a container to save terraform.state file. Storage account and container can be created through script \IaC-Terraform\BackendStorageAccountAndContainer.ps1


✨ Create a keyvault for storing postgresql administrator credentials and connection string.


✨ Make sure you have different Subscriptions across Environments (Dev/Acc/Prod) with their respective Service principals, ACRs, Service Connection etc.


✨ Create configuration filess for Terraform, including main.tf, variables.tf, dev.tvars (for the development environment), and output.tf.

✨ Create a folder name IaC-Terraform inside in azure repo "CloudDevOpsForJavaReact"


✨ Create [Infrastructure Pipeline](https://github.com/sujaydana82/CloudDevOpsForJavaReact/tree/main/IaC-Terraform/dev/azure-pipeline.yml) and [Cleanup Pipeline](https://github.com/sujaydana82/CloudDevOpsForJavaReact/tree/main/IaC-Terraform/dev/cleanup-pipeline.yml) 


✨  azure-pipeline will create 8 azure resources (app service plan, app service, container registry, workspace, application insights, postgresql flexible server, postgresql flexible database, postgresql firewall rule)


✨  After pipeline is deployed, Terraform.state file will be saved in storageaccount/container

✨ Created tables in postegresql database through psql cli tool. set environment variable for psql tool

psql "host=myskddbserver.postgres.database.azure.com port=5432 dbname=myskddatabase user=psqladmin@myskddbserver password=H@Sh1CoR3! sslmode=require"

CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    description VARCHAR(100),
    manager VARCHAR(50)
);

CREATE TABLE Manager (
    id SERIAL PRIMARY KEY,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    description VARCHAR(255)
);

✨ Monitoring and Auditing
    - Set up monitoring and auditing for the infrastructure resources using the monitoring and logging tools provided by Azure.
    - Created App-Insights to monitor data
    - Enabled diagnostic-settings to check logs if required in case of any app-service failures
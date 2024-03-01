# Create the main project directory, you can change the folder name as per your requirement, I choosed "IaC-Terraform"
New-Item -ItemType Directory -Path "terraform_project"

# Create main Terraform files
New-Item -ItemType File -Path "terraform_project/main.tf"
New-Item -ItemType File -Path "terraform_project/variables.tf"
New-Item -ItemType File -Path "terraform_project/dev.tfvars"
New-Item -ItemType File -Path "terraform_project/acc.tfvars"
New-Item -ItemType File -Path "terraform_project/prd.tfvars"
New-Item -ItemType File -Path "terraform_project/outputs.tf"

# Create modules directory and subdirectories
New-Item -ItemType Directory -Path "terraform_project/modules"
New-Item -ItemType Directory -Path "terraform_project/modules/common"
New-Item -ItemType Directory -Path "terraform_project/modules/azure"
New-Item -ItemType Directory -Path "terraform_project/modules/azure/storage_account"
New-Item -ItemType Directory -Path "terraform_project/modules/azure/container"
New-Item -ItemType Directory -Path "terraform_project/modules/azure/app_service"
New-Item -ItemType Directory -Path "terraform_project/modules/azure/app_service_plan"
New-Item -ItemType Directory -Path "terraform_project/modules/azure/container_registry"
New-Item -ItemType Directory -Path "terraform_project/modules/azure/sql_server"
New-Item -ItemType Directory -Path "terraform_project/modules/azure/application_insights"

# Create main Terraform files for each module
New-Item -ItemType File -Path "terraform_project/modules/azure/storage_account/main.tf"
New-Item -ItemType File -Path "terraform_project/modules/azure/storage_account/variables.tf"
New-Item -ItemType File -Path "terraform_project/modules/azure/storage_account/outputs.tf"

New-Item -ItemType File -Path "terraform_project/modules/azure/container/main.tf"
New-Item -ItemType File -Path "terraform_project/modules/azure/container/variables.tf"
New-Item -ItemType File -Path "terraform_project/modules/azure/container/outputs.tf"

New-Item -ItemType File -Path "terraform_project/modules/azure/app_service/main.tf"
New-Item -ItemType File -Path "terraform_project/modules/azure/app_service/variables.tf"
New-Item -ItemType File -Path "terraform_project/modules/azure/app_service/outputs.tf"

New-Item -ItemType File -Path "terraform_project/modules/azure/app_service_plan/main.tf"
New-Item -ItemType File -Path "terraform_project/modules/azure/app_service_plan/variables.tf"
New-Item -ItemType File -Path "terraform_project/modules/azure/app_service_plan/outputs.tf"

New-Item -ItemType File -Path "terraform_project/modules/azure/container_registry/main.tf"
New-Item -ItemType File -Path "terraform_project/modules/azure/container_registry/variables.tf"
New-Item -ItemType File -Path "terraform_project/modules/azure/container_registry/outputs.tf"

New-Item -ItemType File -Path "terraform_project/modules/azure/sql_server/main.tf"
New-Item -ItemType File -Path "terraform_project/modules/azure/sql_server/variables.tf"
New-Item -ItemType File -Path "terraform_project/modules/azure/sql_server/outputs.tf"

New-Item -ItemType File -Path "terraform_project/modules/azure/application_insights/main.tf"
New-Item -ItemType File -Path "terraform_project/modules/azure/application_insights/variables.tf"
New-Item -ItemType File -Path "terraform_project/modules/azure/application_insights/outputs.tf"

# Create Azure Pipelines directory and subdirectories
New-Item -ItemType Directory -Path "terraform_project/azure-pipelines"
New-Item -ItemType Directory -Path "terraform_project/azure-pipelines/dev"
New-Item -ItemType Directory -Path "terraform_project/azure-pipelines/acc"
New-Item -ItemType Directory -Path "terraform_project/azure-pipelines/prd"

# Output success message
Write-Host "Terraform project folder structure created successfully."

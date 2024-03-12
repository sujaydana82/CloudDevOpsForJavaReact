# 🚀 Folder Structure

##   Environment
    We can create multiple environments here like Development, Acceptance and Production 
    [Here I've created only development and add tf file to build infra].

##   Pipeline
    We have pipelines creating Infrastrucute and cleanup resources when required.

## ✨	Environment Based Infrastructure As Code (IAC):

### [IaC Codebase](https://github.com/sujaydana82/CloudDevOpsForJavaReact/tree/main/IaC-Terraform/dev)

Here, we are creating following services inside.

### Resource Group
- To have all resources together.
### ACR
- To store our docker images
### Service Principal
- This SP is required to create Service Connection using Docker Registry 
- In Azure Devops -> Project Setting (Under Pipelines) 
- Giving ACR Push role, so that we can push docker images to Registry.
### App-Service
- Creating PaaS Service to deploy our application both backend and frontend, we have integrated App services with following.
    - #### App-Insights to monitor data
    - #### Enabled diagnostic-settings to check logs if required in case of any app-service failures
    - #### Auto-scale app services based on the rule set to it

## ✨	Pipeline:

### ✨ [Infrastructure Pipeline](https://github.com/sujaydana82/CloudDevOpsForJavaReact/tree/main/IaC-Terraform/dev/azure-pipeline.yml)
- Please create respective Service Connection(Azure Resource Manager)
- Have state file for each Environment you deploy
- We can remove environment during runtime as per the requirement.
- Please create Environments under Pipelines in Azure Devops with approvals to hold the Apply for review.

### ✨ [Cleanup Pipeline](https://github.com/sujaydana82/CloudDevOpsForJavaReact/tree/main/IaC-Terraform/dev/cleanup-pipeline.yml)
- This pipeline is used to Cleanup infrastructure based on ResourceGroup.
- Please create Variable Groups across different Environments.
- To store client_id, client_secret and subscription_id
- We can use same Service Connection what we are using for creating infrastructure

### ✨ [Application Pipeline](https://github.com/sujaydana82/CloudDevOpsForJavaReact\react-and-spring-data-rest\azure-pipeline.yml")
- This pipeline is to build application code and create docker image and push images to ACR
- Create Service Connection using Docker Registry for each environment as there will be different ACRs and SPs across subscription.
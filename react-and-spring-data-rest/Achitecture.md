Creating an end-to-end architecture for deploying an application with Java backend and React frontend on Azure cloud using Terraform in Azure DevOps CI/CD involves several key steps. Here's a high-level outline of the process:

1. **Cloud Architecture Design**:
   - **Frontend Backend Separation**: Separate frontend and backend architecture using different pipelines and containers.
   - **Real Database Integration**: Configure the application to use a real database service on Azure like Azure SQL Database.
   - **Scalability**: Implement auto-scaling capabilities for the infrastructure to handle varying loads.

2. **Infrastructure as Code (IaC) using Terraform**:
   - Define the Azure infrastructure components using Terraform scripts (Virtual Network, Subnets, Load Balancers, etc.).
   - Ensure the Terraform scripts are organized, modular, and follow best practices.

3. **Continuous Integration and Continuous Deployment (CI/CD)**:
   - **Backend CI/CD Pipeline**:
     - Create a pipeline in Azure DevOps for building and testing the Java backend.
     - Build and push a Docker image for the backend.
     - Deploy the backend container to Azure Container Registry.

   - **Frontend CI/CD Pipeline**:
     - Create a pipeline in Azure DevOps for building the React frontend.
     - Build and push a Docker image for the frontend.
     - Deploy the frontend container to Azure Container Registry.

4. **Full Application Deployment**:
   - Use the IaC scripts to deploy the infrastructure on Azure.
   - Deploy the backend and frontend containers from Azure Container Registry to Azure App Service.

5. **Monitoring and Auditing**:
   - Set up monitoring and logging for the deployed infrastructure and application using Azure Monitor and Azure Log Analytics.
   - Ensure proper audit trails are in place for monitoring infrastructure changes.

6. **Documentation**:
   - Provide detailed documentation on the architecture, deployment process, and configuration steps.
   - Include instructions on how to fork the repository, configure environment variables, and deploy the solution on Azure cloud.

7. **Bonus Points**:
   - Implement cleanup/destroy functionality as part of the pipelines to ensure easy teardown of resources.
   - Implement auto-scaling capabilities for the infrastructure to handle varying load.
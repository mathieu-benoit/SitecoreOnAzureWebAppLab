# Overview (5min)

## Objectives

The overall goal of this lab is to deploy and adapt the [default and official Sitecore ARM Templates](https://github.com/Sitecore/Sitecore-Azure-Quickstart-Templates) to be able to leverage the associated Microsoft Azure infrastructure and play with the different features of the Azure services provisionned. At the end of the day, make you more familiar with Microsoft Azure and the Azure services needed for your Sitecore solutions.
During all this lab, we will use the Sitecore xM4/Large configuration: the CM and the CD are split, and we are not managing any MongoDB databases, so no Sitecore Analytics. The Azure Solution Architecture associated is:

![Sitecore xM Architecture Diagram](./imgs/sitecore%20xm%20architecture%20diagram.png)

## Azure services diagram

This diagram below represents how you will organize your different services through this lab. The [Azure Resource Groups](https://docs.microsoft.com/azure/azure-resource-manager/resource-group-overview#resource-groups) are an important piece to understand and grouping your different resources in different resource groups is a good practice.

![Resource Groups Overview](./imgs/resource%20groups%20overview.PNG)

- CloudShell_RG
  - This resource group will contain the associated Azure Cloud Shell's storage. It will be provisioned during the [Setup lab](../Setup/README.md).
  - Not necessary but will help us to run our CLI 2.0 and PowerShell commands. It's attached to your Azure portal login/user.
- Assets_RG
  - This resource group will contain the Blob storage to store the necessary assests to deploy properly the solution: Sitecore packages, license, etc. It will be provisioned during the [Setup lab](../Setup/README.md).
  - Not necessary but will help us to expose and centralize the different assests needed during the deployments.
- Services_RG
  - This resource group will contain all the services provisionned once we will deployed the Sitecore solution. It will be provisioned during the [ARM Templates lab](../ARM%20Templates/README.md).
  - That's where all the services defined by the ARM Template will be deployed.
- KeyVault_RG
  - This resource group will contain the KeyVault sercice to store secrets used during the deployments. It will be provisioned during the [ARM Templates lab](../ARM%20Templates/README.md).
  - Not necessary but will help us to keep safe the secrets needed for the deployments such as: password, user name, etc.
- VSTS_RG
  - This resource group will contain the VSTS service to be able to setup the CI/CD and DevOps pipeline. It will be provisioned during the [DevOps with VSTS Lab](../DevOps%20with%20VSTS/README.md).
  - Not necessary but will help us to manage and design the CI/CD and DevOps pipelines.

## Azure services pricing estimation

The estimations below of the Azure services cost are here as an exercise for you by using the [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/). The prices could change and need to be adapted and reevaluated for your needs. Furthermore, we are hosting the services in East US and will estimate the prices in US dollars.

- CloudShell_RG
  - Services pricing details:
    - [Azure Storage - General - LRS](https://azure.microsoft.com/pricing/details/storage/blobs/)
  - Estimation for the purpose of this lab: <1$US/month
- Assets_RG
  - Services pricing details:
    - [Azure Storage - Blob - LRS](https://azure.microsoft.com/pricing/details/storage/blobs/)
  - Estimation for the purpose of this lab: <1$US/month
- Services_RG
  - Services pricing details:
    - [Azure App Service](https://azure.microsoft.com/pricing/details/app-service/)
    - [Azure SQL Databases](https://azure.microsoft.com/pricing/details/sql-database/)
    - [Azure Search](https://azure.microsoft.com/pricing/details/search/)
    - [Azure Application Insights](https://azure.microsoft.com/pricing/details/application-insights/)
    - [Azure Redis Cache](https://azure.microsoft.com/pricing/details/cache/)
  - Estimation for the purpose of this lab (Sitecore xM4/Large topology):
    - 2 Azure App Service (1 B2 + 1 S3) : 409.20$US/month
    - 3 Azure SQL Databases (2 S1 + 1 S2): 135.03$US/month
    - 1 Azure Search (1 S1): 249.99$US/month
    - 1 Azure Application Insights (1 B): 0$US/month
    - 1 Azure Redis Cache (1 C1): 40.92$US/month
    - Total: 835.14$US/month
- KeyVault_RG
  - Services pricing details:
    - [Azure KeyVault](https://azure.microsoft.com/pricing/details/key-vault/)
  - Estimation for the purpose of this lab: 0$US/month
- VSTS_RG
  - Services pricing details:
    - [Visual Studio Team Services](https://azure.microsoft.com/pricing/details/visual-studio-team-services/)
  - Estimation for the purpose of this lab: 0$US/month

## Resources

- [Microsoft Azure, Cloud and Enterprise Symbol / Icon Set](https://www.microsoft.com/download/details.aspx?id=41937)
- [Azure enterprise scaffold - prescriptive subscription governance](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-manager-subscription-governance)
- [Sitecore ARM templates – topologies and tiers](https://kb.sitecore.net/articles/848330)
- [Azure data center compatibility table](https://kb.sitecore.net/articles/617478)
- [Sitecore Cloud - Status Page](https://status.cloud.sitecore.net/)
- [Sitecore on Microsoft Azure – Module compatibility](https://kb.sitecore.net/articles/201557)

## What have you seen?

- The importance of the location of your Azure services within your Azure subscriptions and your Azure resource groups
- Sitecore provides some guidance regarding templates, topologies, tiers, data center compatibility, etc. you could leverage
- You could estimate your Azure services costs by using the Azure Pricing Calculator based on the each Azure services criteria exposed on their pricing details page
- Beautiful icons and symbols are available to build your own Azure architecture diagrams ;)
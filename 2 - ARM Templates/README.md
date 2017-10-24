# ARM Templates (90min)

TODO
- Add SaS token for more security

## Prerequisities

- Make sure you went through the previous "[1 - Setup](../1%20-%20Setup/README.md)" lab.

## Objectives

Throughout this exercise, you will use:
- Azure Blob Storage
- Azure Cloud Shell: Azure PowerShell
- Azure KeyVault
- ARM Templates
- Microsoft Azure Storage Explorer
- Visual Studio Code

## Task 1: Deploy the default Sitecore XM ARM Templates (45 min)

In this section, the attendee will deploy the Azure services defined in the Sitecore ARM Template by running some PowerShell commands.

1. Go to the Azure portal [https://portal.azure.com](https://portal.azure.com)
2. Open the Azure Cloud Shell for PowerShell (quickstart available [here](https://docs.microsoft.com/en-us/azure/cloud-shell/quickstart-powershell))
3. In this console type these successive commands:

```
#to list your Azure subscriptions
dir

#to select `Your-Subscription` subscription you would like to use for this lab
cd Your-Subscription

#to list all the resource groups you have under the subscription `Your-Subscription`
dir

#to create a new `sitecorelab<yourname>` resource group
#Note: sitecorelab<yourname> should be globally unique because it will reused to name all the Azure services deployed by the ARM Template. So replace the `<yourname>` by your name.
New-AzureRmResourceGroup -Name sitecorelab<yourname> -Location "East US"

#to select `sitecorelab<yourname>` resource group
cd ResourceGroups/sitecorelab<yourname>

#to deploy all the Azure services defined by the Sitecore ARM Templates
C:\users\ContainerAdministrator\CloudDrive\DeployDefaultARMTemplates.ps1 -LicenseFile "C:\users\ContainerAdministrator\CloudDrive\license.xml"
#and supply the following values when prompted:
#ResourceGroupName: sitecorelab<yourname>
#AssetsBlobStorageAccountName: sitecorelabassets<yourname>
#SqlServerPassword: demo@pass12345
```

4. Then all the resources defined within the associated ARM Templates will be deployed like illustrated below. It will take about 30 min. When it will end you will be able to see the 4 deployments entries in the "Deployments" blade of the resource group.

![Resource group deployments](./imgs/resource%20group%20deployments.PNG)

![Azure resources created](./imgs/azure%20resources%20created.PNG)

## Task 2: Read and interpret the PowerShell script and the Sitecore ARM Template (15 min)

In this section, the attendee will learn more about the PowerShell and ARM Templates used in the previous task.
Remark: before moving forward with this task, make sure your deployment started properly, let's check the first lines on the Azure Cloud Shell console.

1. You could open the [DeployDefaultARMTemplates.ps1](../1 - Setup/DeployDefaultARMTemplates.ps1) script and see/learn what is in here. Here are the main points you should see:
  - The `Param` section is where all the parameters are defined. Some of them are pre-initialized but could be overriden, others are mandatory when invoking this script.
  - Then you will find different variables initialized like `CdMsDeployPackageUrl`, `CmMsDeployPackageUrl`, `licenseFileContent`, etc.
  - Finnaly you will find the PowerShell command to deploy an ARM Templates with `New-AzureRmResourceGroupDeployment`.

2. You could open the [Sitecore XM Environment](https://github.com/Sitecore/Sitecore-Azure-Quickstart-Templates/tree/master/Sitecore%209.0.0/XM) we deployed with this script and see/learn what is in here. Don't forget the nested templates. Here are the main points you should see:
  - The first file to look at is the entry point of the ARM Template deployment: `azuredeploy.json`. In this file, like any ARM Template, you will find 3 main areas: `variables`, `parameters` (you could override the default values here by passing new value when invoking the ARM Template and `resources`. In the latest, you will 3 resources deployed which are called "nested deployments": `infrastructure`, `application` and `module`.
  - The second file to look at is `nested/infrastructure.json` which will take care of the definition of all the Azure services to deploy: App Service Plan, Web Apps, Azure SQL Server, Azure SQL Database, Application Insights, etc.
  - The third file to look at is `nested/application.json` which will take care of the definition of the 2 WebDeploy on the 2 respective Azure Web App (CM and CD).

## Task 3: Configure an Azure KeyVault to store secrets (10 min)

Remark: before starting this part, you should check what is the status of your deployment.

In this section, the attendee will create an Azure KeyVault and will store some secrets into it by using the Azure Cloud Shell Bash within the Azure portal, then we will modify the ARM Template with some custom updates.

1. Go to the Azure portal [https://portal.azure.com](https://portal.azure.com)
2. Open the Azure Cloud Shell for Bash (quickstart available [here](https://docs.microsoft.com/en-us/azure/cloud-shell/quickstart))
  - Important note: when doing that, you will close the current PowerShell session but the ARM Template deployment currently running, if not finished yet, will continue.
3. In this console type these successive commands:

```
#list your Azure subscriptions
az account list --output table

#select `Your-Subscription` subscription you would like to use for this lab
az account set --subscription Your-Subscription

#list all the resource groups you have under the subscription `Your-Subscription`
az group list --output table

#create a new `Sitecore_Lab-KeyVault` resource group
az group create -l eastus -n Sitecore_Lab-KeyVault

#create a `sitecorelabkeyvault` Azure KeyVault account within the `Sitecore_Lab-KeyVault` resource group 
az keyvault create --name "sitecorelabkeyvault" --resource-group "Sitecore_Lab-KeyVault" --location "East US" --enabled-for-template-deployment true

#store 2 secrets into this KeyVault just created: `SqlServerLogin` and `SqlServerPassword`.
az keyvault secret set --vault-name "sitecorelabkeyvault" --name "SqlServerLogin" --value "demouser"
az keyvault secret set --vault-name "sitecorelabkeyvault" --name "SqlServerPassword" --value "demo@pass12345"
```

4. So now the Azure KeyVault `sitecorelabkeyvault` has 2 secrets we will use in the following task below, you could check that by opening the associated Azure KeyVault's "Secrets" blade:

![Azure KeyVault Secrets Deployed](./imgs/keyvault%20secrets%20deployed.png)

Note: We will use these 2 secrets with the next task with the deployment of a custom ARM Templates.
Furthermore, we just stored 2 secrets for this current lab, but you should store more: other SQL databases passwords and login, Sitecore Admin password, etc. per environment for example: DEV, QA, PROD, etc.

## Task 4: Deploy a custom Sitecore XM ARM Templates (15 min)

See corresponding section in the step-by-step document [here](../Sitecore%20on%20Azure%20PaaS%20services%20-%20Hands-on%20Lab.pdf).

## Resources

- [From the community, Editing Sitecore Azure ARM Templates in 4 parts](http://robearlam.com/blog/editing-sitecore-azure-arm-templates-part-1-introduction/)
- [From the community, more advanced ARM Templates customizations](https://alwaysupalwayson.blogspot.ca/2017/02/lets-cook-and-play-with-default.html)
- [Azure KeyVault documentation](https://docs.microsoft.com/en-us/azure/key-vault/)
- [Securing Microsoft Azure Resources for a Sitecore deployment](https://doc.sitecore.net/sitecore_experience_platform/setting_up_and_maintaining/sitecore_on_azure/analytics/securing_microsoft_azure_resources_for_a_sitecore_deployment)
- TODO BROKEN [Getting Started with Sitecore Azure Toolkit](https://doc.sitecore.net/cloud/working_with_sitecore_azure/configuring_sitecore_azure/getting_started_with_sitecore_azure_toolkit)
- [Configure WFFM for deployment on the Azure App Service](https://doc.sitecore.net/web%20forms%20for%20marketers/setting%20up%20web%20forms/installing/configure%20wffm%20for%20deployment%20on%20the%20azure%20app%20service)
- [Deployment failure in Azure subscriptions with spending limit](https://kb.sitecore.net/articles/915122)
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
ResourceGroupName: sitecorelab<yourname>
AssetsBlobStorageAccountName: sitecorelabassets<yourname>
SqlServerPassword demo@pass12345
```

4. Then all the resources defined within the associated ARM Templates will be deployed like illustrated below. It will take about 30 min. You could see as well 4 deployments entries in the "Deployments" blade of the resource group.

![Resource group deployments](./imgs/resource%20group%20deployment.PNG)

![Azure resources created](./imgs/azure%20resources%20created.PNG)

## Task 2: Configure an Azure KeyVault to store secrets (10 min)

TODO

## Task 3: Deploy a custom Sitecore XM ARM Templates (15 min)

TODO

## Resources

- [From the community, Editing Sitecore Azure ARM Templates in 4 parts](http://robearlam.com/blog/editing-sitecore-azure-arm-templates-part-1-introduction/)
- [From the community, more advanced ARM Templates customizations](https://alwaysupalwayson.blogspot.ca/2017/02/lets-cook-and-play-with-default.html)
- [Azure KeyVault documentation](https://docs.microsoft.com/en-us/azure/key-vault/)
- [Securing Microsoft Azure Resources for a Sitecore deployment](https://doc.sitecore.net/sitecore_experience_platform/setting_up_and_maintaining/sitecore_on_azure/analytics/securing_microsoft_azure_resources_for_a_sitecore_deployment)
- TODO BROKEN [Getting Started with Sitecore Azure Toolkit](https://doc.sitecore.net/cloud/working_with_sitecore_azure/configuring_sitecore_azure/getting_started_with_sitecore_azure_toolkit)
- [Configure WFFM for deployment on the Azure App Service](https://doc.sitecore.net/web%20forms%20for%20marketers/setting%20up%20web%20forms/installing/configure%20wffm%20for%20deployment%20on%20the%20azure%20app%20service)
- [Deployment failure in Azure subscriptions with spending limit](https://kb.sitecore.net/articles/915122)

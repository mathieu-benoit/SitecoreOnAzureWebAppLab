# ARM Templates (90min)

TODO
- Add SaS token for more security

## Prerequisities

- Make sure you went through the previous "[1 - Setup](../1%20-%20Setup/README.md)" lab.
- Make sure you have your Sitecore XM package zip file (8.2.5 - 170728). Otherwise ask your Sitecore partner or rep.
- Make sure you have your Sitecore license.xml file. Otherwise ask your Sitecore partner or rep.

## Objectives

Throughout this exercise, you will use:
- Azure Blob Storage
- Azure Cloud Shell: CLI 2.0 and Azure PowerShell
- Azure KeyVault
- ARM Templates
- Microsoft Azure Storage Explorer
- Visual Studio Code

## Task 1: Prepare the files (15 min)

In this section, the attendee will prepare all the files needed for the deployment of the Sitecore ARM Templates and will drop them in a dedicated Azure Blob Storage.

1. Go to the Azure portal [https://portal.azure.com](https://portal.azure.com)
2. Open the Azure Cloud Shell for Bash (quickstart available [here](https://docs.microsoft.com/en-us/azure/cloud-shell/quickstart))
3. In this console type these successive commands:
- ```az account list --output table``` - to list your Azure subscriptions
- ```az account set --subscription Your-Subscription``` - to select `Your-Subscription` subscription you would like to use for this lab
- ```az group list --output table``` - to list all the resource groups you have under the subscription `Your-Subscription`
- ```az group create -l eastus -n Sitecore_Lab-Assets``` - to create a new `Sitecore_Lab-Assets` resource group
- ```az resource list -g Sitecore_Lab-Assets --output table``` - to list all the resources you have under the resource group `Sitecore_Lab-Assets` (should be empty for now)
- ```az storage account create -n sitecorelabassets -g Sitecore_Lab-Assets -l eastus --sku Standard_LRS``` - to create a new `sitecorelabassets` storage account in the EastUS datacenter
Note: the storage account name should be globally unique.
4. Open locally the Microsoft Azure Storage Explorer tool and navigate to your `sitecorelabassets` Storage account
5. Right click on "Blob Containers" and choose "Create Blob Container" like illustrated below:

![Create Blob Container](./imgs/create%20blob%20container.PNG)

5. Once unzipped locally, upload the two associated files of the Sitecore XM package zip file (8.2.5 - 170728) in the `sitecore-assets` container
6. Upload the Sitecore license.xml file as well in the `sitecore-assets` container

![Sitecore Assets uploaded](./imgs/sitecore%20assets%20uploaded.PNG)

## Task 2: Deploy the default Sitecore XM ARM Templates (45 min)

TODO

## Task 3: Configure an Azure KeyVault to store secrets (10 min)

TODO

## Task 4: Deploy a custom Sitecore XM ARM Templates (15 min)

TODO

## Resources

From the community, Editing Sitecore Azure ARM Templates in 4 parts
http://robearlam.com/blog/editing-sitecore-azure-arm-templates-part-1-introduction/

From the community, more advanced ARM Templates customizations
https://alwaysupalwayson.blogspot.ca/2017/02/lets-cook-and-play-with-default.html

Azure KeyVault documentation
https://docs.microsoft.com/en-us/azure/key-vault/

Securing Microsoft Azure Resources for a Sitecore deployment
https://doc.sitecore.net/sitecore_experience_platform/setting_up_and_maintaining/sitecore_on_azure/analytics/securing_microsoft_azure_resources_for_a_sitecore_deployment

Getting Started with Sitecore Azure Toolkit
https://doc.sitecore.net/cloud/working_with_sitecore_azure/configuring_sitecore_azure/getting_started_with_sitecore_azure_toolkit

Configure WFFM for deployment on the Azure App Service
https://doc.sitecore.net/web%20forms%20for%20marketers/setting%20up%20web%20forms/installing/configure%20wffm%20for%20deployment%20on%20the%20azure%20app%20service 

Deployment failure in Azure subscriptions with spending limit
https://kb.sitecore.net/articles/915122


Azure CLI 2.0 Commands
https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest

https://docs.microsoft.com/en-us/azure/storage/common/storage-powershell-guide-full

# Setup of the lab (15min)

## Prerequisities

- Make sure you went through the previous "[0 - Overview](../0%20-%20Overview/README.md)" lab.
- Make sure you have your Sitecore XM Scaled package zip file (9.0.0 - 171002). Otherwise ask your Sitecore partner or rep.
- Make sure you have your Sitecore license.xml file. Otherwise ask your Sitecore partner or rep.

## Objectives

Throughout this exercise, you will use:
- Microsoft Azure portal
- Azure Cloud Shell: CLI 2.0
- Microsoft Azure Storage Explorer tool
- Visual Studio Code

General remark: even if this lab could be excecuted on any plaform like: Windows, Linux or MacOS, we are illustrating it with images and folder paths on a Windows machine, but again you could easily translate them to Linux or MacOS.

## Task 1 - Login to the Azure portal (2min)

In this section, the attendee will verify he/she is able to login to the Microsoft Azure Portal. We will verify as well that he/she has an Azure Subscription for the lab. This check point is very important, if you have any question here, please ask your proctor.
1.	Launch an Internet browser and navigate to https://portal.azure.com. Once prompted, login with your Microsoft Azure credentials. If prompted, choose whether your account is an organization account or just a Microsoft Account. 
Note: You may need to launch an "in-private" session in your browser if you have multiple Microsoft Accounts.  
2.	Once connected, you could verify you will be able to use the correct Azure subscription by navigating to “More services” and then search for “Subscriptions” and see there your subscriptions available with these credentials.

![Validate Azure Subscription](./imgs/validate%20subscription.png)

## Task 2 - Install complementary tools (3min)

3. Install Microsoft Azure Storage Explorer at [http://storageexplorer.com](http://storageexplorer.com) (Windows, Linux or MacOS).
4. Open Storage Explorer tool and follow the instructions of the Azure connection wizard to make sure you are able to connect to your Azure subscription.
4. Install Visual Studio Code at [https://code.visualstudio.com](https://code.visualstudio.com) (Windows, Linux or MacOS).
5. Open Visual Studio Code and install the "Azure Resource Manager Tools" extension like illustrated below and click on the "Reload" button once the installation is completed.

![TODO](./imgs/arm%20tools%20extension.png)

## Task 3: Prepare the assets (10 min)

In this section, the attendee will prepare all the files needed for the deployment of the Sitecore ARM Templates and will drop them in a dedicated Azure Blob Storage.

1. Go to the Azure portal [https://portal.azure.com](https://portal.azure.com)
2. Open the Azure Cloud Shell for Bash (quickstart available [here](https://docs.microsoft.com/en-us/azure/cloud-shell/quickstart))
3. In this console type these successive commands:
```
#list your Azure subscriptions
az account list --output table

#select `Your-Subscription` subscription you would like to use for this lab
az account set --subscription Your-Subscription

#list all the resource groups you have under the subscription `Your-Subscription`
az group list --output table

#create a new `Sitecore_Lab-Assets` resource group
az group create -l eastus -n Sitecore_Lab-Assets

#list all the resources you have under the resource group `Sitecore_Lab-Assets` (should be empty for now)
az resource list -g Sitecore_Lab-Assets --output table

#create a new `sitecorelabassets<yourname>` storage account in the EastUS datacenter
#Note: the storage account name `sitecorelabassets<yourname>` should be globally unique. So replace the `<yourname>` by your name.
az storage account create -n sitecorelabassets<yourname> -g Sitecore_Lab-Assets -l eastus --sku Standard_LRS
```

4. Open locally the Microsoft Azure Storage Explorer tool and navigate to your `sitecorelabassets<yourname>` Storage account
5. Right click on "Blob Containers" and choose "Create Blob Container" like illustrated below and create the `sitecoreassets` container:

![Create Blob Container](./imgs/create%20blob%20container.PNG)

5. Once unzipped locally, upload the two associated files of the Sitecore XM Scaled package zip file (9.0.0 - 171002) in the `sitecoreassets` container
6. Upload the Sitecore license.xml file as well in the `sitecoreassets` container
TODO - review here - cd C:\users\ContainerAdministrator\CloudDrive instead

![Sitecore Assets uploaded](./imgs/sitecore%20assets%20uploaded.PNG)

## Resources

- [Azure CLI 2.0 Commands](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest)
- https://docs.microsoft.com/en-us/azure/storage/common/storage-powershell-guide-full
- Not required for this lab, but if you would like to provision an Azure Virtual Machine you could for example use the [Azure DevTest Labs](https://docs.microsoft.com/en-us/azure/devtest-lab/devtest-lab-overview)

## What have you seen?

TODO
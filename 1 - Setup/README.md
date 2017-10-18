# Setup of the lab (5min)

## Prerequisities

- Make sure you went through the previous "[0 - Overview](../0%20-%20Overview/README.md)" lab.

## Objectives

Throughout this exercise, you will make sure:
- You have access to the Microsoft Azure portal
- You have installed the Microsoft Azure Storage Explorer tool
- You have installed the Visual Studio Code tool

General remark: even if this lab could be excecuted on any plaform like: Windows, Linux or MacOS, we are illustrating it with images and folder paths on a Windows machine, but again you could easily translate them to Linux or MacOS.

## Task 1 - Login to the Azure portal (2min)

In this section, the attendee will verify he/she is able to login to the Microsoft Azure Portal. We will verify as well that he/she has an Azure Subscription for the lab. This check point is very important, if you have any question here, please ask your proctor.
1.	Launch an Internet browser and navigate to https://portal.azure.com. Once prompted, login with your Microsoft Azure credentials. If prompted, choose whether your account is an organization account or just a Microsoft Account. 
Note: You may need to launch an "in-private" session in your browser if you have multiple Microsoft Accounts.  
2.	Once connected, you could verify you will be able to use the correct Azure subscription by navigating to “More services” and then search for “Subscriptions” and see there your subscriptions available with these credentials.

![Validate Azure Subscription](./imgs/validate%20subscription.png)

TODO - Azure Cloud Shell setup (CLI 2.0 or PowerShell)

## Task 2 - Install complementary tools (3min)

3. Install Microsoft Azure Storage Explorer at [http://storageexplorer.com](http://storageexplorer.com) (Windows, Linux or MacOS).
4. Open Storage Explorer tool and follow the instructions of the Azure connection wizard to make sure you are able to connect to your Azure subscription.
4. Install Visual Studio Code at [https://code.visualstudio.com](https://code.visualstudio.com) (Windows, Linux or MacOS).
5. Open Visual Studio Code and install the "Azure Resource Manager Tools" extension like illustrated below and click on the "Reload" button once the installation is completed.

![TODO](./imgs/arm%20tools%20extension.png)

## Takeaways

- Not required for this lab, but if you would like to provision an Azure Virtual Machine you could for example use the Azure DevTest Labs
  - https://docs.microsoft.com/en-us/azure/devtest-lab/devtest-lab-overview
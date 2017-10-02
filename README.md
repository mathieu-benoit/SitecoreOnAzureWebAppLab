# SitecoreOnAzureWebAppLab

## Table of content

1. [Setup](./1 - Setup/README.md)
2. [ARM Templates](./2 - ARM Templates/README.md)
3. [SQL Database](./3 - SQL Database/README.md)
4. [App Service and Web App](./4 - App Service and Web App/README.md)
5. [Azure Search](./5 - Search/README.md)
6. [Application Insights](./6 - Application Insights/README.md)
7. [QnA Maker and Bot Service](./7 - QnA Maker and Bot Service/README.md)
8. [DevOps with VSTS](./8 - DevOps with VSTS/README.md)

## Revision History

- 2017-06-21
 - Update the SQL Database Georeplication setup according the new transparent geographic failover of database groups feature.
- 2017-06-08
 - Update references to Sitecore Publishing Service 2.0.1 (which fixes installation issue)
 - Update references to Sitecore 8.2 update 3 (rev. 170407) – ARM Templates, etc.
 - Add IP restriction feature on Azure Web Apps
- 2017-05-11
 - Use Visual Studio 2017 Community to 15.2 through Azure DevTest Lab
 - Leverage the new Azure Cloud Shell instead of doing that through the Azure portal UI to configure the Azure KeyVault
 - Add a new entry “Annotations on metric charts” with Application Insights
- 2017-04-07 
 - Initial version

## Introduction

This hands-on lab is a step-by-step lab which allows to satisfy different role (dev, ops, etc.) with different levels of expertise with Sitecore or Microsoft Azure. By provisioning the necessary Azure services needed you will be able to play with the key features of them.

You will need an Azure subscription to be able to run this lab for the Azure services provisioning.

You will need these different assets from Sitecore – if you don’t, please ask your Sitecore partner or rep:
- License.xml to run Sitecore XM on Azure Web App (used in Exercise 2 - ARM Templates (85 min))
- Sitecore XM package zip file 8.2.3 containing the CM and CD MSDeploy packages (used in Exercise 2 - ARM Templates (85 min))
- Sitecore Publishing Service 2.0.1

Here are the Sitecore concepts you are not going to see with this lab (for now):
- No pure/deep Sitecore development
- No MongoDB
- No TDS nor Unicorn
- No local dev/test
- No Sitecore Azure Toolkit

## Backlog of future updates and improvements:

- Mention the new feature: [Announcing general availability of the new App Service Premium Plan](https://azure.microsoft.com/en-us/blog/announcing-general-availability-of-the-new-app-service-premium-plan/)
- Mention the new feature: [Introducing the New App Service Support Center (Preview)](https://blogs.msdn.microsoft.com/appserviceteam/2017/09/28/introducing-the-new-app-service-support-center-preview/)
- Update the repo to Sitecore 8.2.5 - https://github.com/Sitecore/Sitecore-Azure-Quickstart-Templates/releases/tag/v1.5.0
- Mention theSitecore ARM templates – topologies and tiers page:
https://kb.sitecore.net/articles/848330
- Update doc with "Publishing Service: high availability": https://kb.sitecore.net/articles/993639
- Add a new section Azure Price estimation with the Azure Pricing Calculator Tool
- Update IP restriction section
 - From the Azure portal: https://blogs.msdn.microsoft.com/appserviceteam/2017/09/13/august-2017-app-service-update/
 - From ARM Templates: https://github.com/shanepeckham/CADLab_Loyalty_Security#ip-restricting-the-app-service-api-app-to-be-callable-only-from-api-management
- Add a new Azure Search Traffic Analytics + PowerBI
https://docs.microsoft.com/en-us/azure/search/search-traffic-analytics
- Add TDS or Unicorn
- Update the CI/CD sections with VSTS to have a complete DevOps pipeline

## Contributions to this repo

Contributions to this repo are more than welcomed! Feel free to fork, clone and then submit your PR to propose your ideas, fixes and improvements for this lab!

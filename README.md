# SitecoreOnAzureWebAppLab

## Table of content

0. [Overview (10min)](0%20-%20Overview/README.md)
1. [Setup (10min)](1%20-%20Setup/README.md)
2. [ARM Templates (90min)](2%20-%20ARM%20Templates/README.md)
3. [SQL Database (20min)](3%20-%20SQL%20Database/README.md)
4. [App Service and Web App (60 min)](4%20-%20App%20Service%20and%20Web%20App/README.md)
5. [Azure Search (15min)](5%20-%20Search/README.md)
6. [Application Insights (20min)](6%20-%20Application%20Insights/README.md)
7. [QnA Maker and Bot Service (20 min)](7%20-%20QnA%20Maker%20and%20Bot%20Service/README.md)
8. [DevOps with VSTS](8%20-%20DevOps%20with%20VSTS/README.md)

## Revision History

- October 2017
  - (In progress) Migrate this lab from Word document to this GitHub repository
  - Replace Azure VM provisioning through the Azure DevTest Labs service by using the Azure Cloud Shell
  - Add the new Overview section
  - Update references to Sitecore 9.0.0 (rev. 171002) – ARM Templates, etc.
  - Update references to Sitecore Publishing Service 2.1.0
- June 2017
  - Update the SQL Database Georeplication setup according the new transparent geographic failover of database groups feature.
  - Update references to Sitecore Publishing Service 2.0.1 (which fixes an installation issue)
  - Update references to Sitecore 8.2 update 3 (rev. 170407) – ARM Templates, etc.
  - Add IP restriction feature on Azure Web Apps
- May 2017
  - Use Visual Studio 2017 Community to 15.2 through Azure DevTest Lab
  - Leverage the new Azure Cloud Shell instead of doing that through the Azure portal UI to configure the Azure KeyVault
  - Add a new entry “Annotations on metric charts” with Application Insights
- April 2017
  - Initial version

## Introduction

This hands-on lab is a step-by-step lab which allows to target different roles (dev, ops, etc.) with different levels of expertise with Sitecore or Microsoft Azure. By provisioning the necessary Azure services needed you will be able to play with the key features of them on Azure.

You will need an Azure subscription to be able to run this lab for the Azure services provisioning.

You will need these different assets from Sitecore – if you don’t, please ask your Sitecore partner or rep:
- License.xml to run Sitecore XM on Azure Web App
- Sitecore XM Scaled package zip file 9.0.0 containing the CM and CD MSDeploy packages
- Sitecore Publishing Service 2.1.0

Here are the Sitecore concepts you are not going to see with this lab (for now):
- No pure Sitecore development - it's not a Sitecore lab.
- No MongoDB - we are leveraging the XM configuration without xDB.
- No TDS nor Unicorn
- No local dev/test - we are using environment in the Cloud mainly by minimizing any local development and manipulation.
- No Sitecore Azure Toolkit - we are using 

## Contributions to this repository

Contributions to this repository are more than welcomed! Feel free to fork, clone and then submit your PR to propose your ideas, fixes and improvements for this lab!

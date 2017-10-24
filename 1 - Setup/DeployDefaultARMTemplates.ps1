# PowerShell script to deploy Sitecore 9.0.0 XM default ARM Template.
# Located here: https://github.com/Sitecore/Sitecore-Azure-Quickstart-Templates/tree/master/Sitecore%209.0.0/XM

Param(
  [string] [Parameter(Mandatory=$true)] $ResourceGroupName,
  [string] $ResourceGroupLocation = "East US",
  [string] $TemplateFile = "https://raw.githubusercontent.com/Sitecore/Sitecore-Azure-Quickstart-Templates/master/Sitecore%209.0.0/XM/azuredeploy.json",
  [string] [Parameter(Mandatory=$true)] $AssetsBlobStorageAccountName,
  [string] $AssetsBlobStorageContainerName = "sitecoreassets",
  [string] $SqlServerLogin = "demouser",
  [string] $SitecoreSku = "Large",
  [string] [Parameter(Mandatory=$true)] $LicenseFile,
  [securestring] [Parameter(Mandatory=$true)] $SqlServerPassword,
  [securestring] $SitecoreAdminPassword = $SqlServerPassword
)

$CdMsDeployPackageUrl = "https://" + $AssetsBlobStorageAccountName  + ".blob.core.windows.net/" + $AssetsBlobStorageContainerName  + "/Sitecore%209.0.0%20rev.%20171002%20(Cloud)_cd.scwdp.zip";
$CmMsDeployPackageUrl = "https://" + $AssetsBlobStorageAccountName  + ".blob.core.windows.net/" + $AssetsBlobStorageContainerName  + "/Sitecore%209.0.0%20rev.%20171002%20(Cloud)_cm.scwdp.zip";

$licenseFileContent = Get-Content -Raw -Encoding UTF8 -Path $LicenseFile | Out-String;

$parameters = New-Object -TypeName Hashtable;
$parameters.Add("cdMsDeployPackageUrl", $CdMsDeployPackageUrl);
$parameters.Add("cmMsDeployPackageUrl", $CmMsDeployPackageUrl);
$parameters.Add("sqlServerLogin", $SqlServerLogin);
$parameters.Add("sqlServerPassword", $SqlServerPassword);
$parameters.Add("sitecoreAdminPassword", $SitecoreAdminPassword);
$parameters.Add("sitecoreSKU", $SitecoreSku);
$parameters.Add("licenseXml", $licenseFileContent);

#Login-AzureRmAccount;
#Select-AzureRmSubscription -SubscriptionId $SubscriptionId;
#New-AzureRmResourceGroup -Name $ResourceGroupName -Location $ResourceGroupLocation;
New-AzureRmResourceGroupDeployment -Name $ResourceGroupName -ResourceGroupName $ResourceGroupName -TemplateFile $TemplateFile -TemplateParameterObject $parameters -Verbose;
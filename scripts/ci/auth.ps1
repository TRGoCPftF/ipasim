# Load Azure PowerShell.
$env:PSModulePath = $env:PSModulePath + ";C:\Modules\azurerm_6.7.0"
Import-Module -Name AzureRm -RequiredVersion 6.7.0 -Verbose

# Login into Azure.
$key = ConvertTo-SecureString $env:AZURE_KEY -AsPlainText -Force
$cred = New-Object `
    System.Management.Automation.PSCredential($env:AZURE_APP_ID, $key)
Add-AzureAccount -Credential $cred -Tenant $env:AZURE_TENANT
Select-AzureSubscription -SubscriptionId 363eb770-e7e5-49a1-b1eb-e9df07ee11ac
## Working with Resources

### Resource Providers

List if resource is available in region

```PowerShell
#Requires -Modules @{ ModuleName="Az.Resources"; ModuleVersion="0.3.0" }
Get-AzResourceProvider |
    Select-Object ProviderNamespace, ResourceTypes |
    Sort-Object ProviderNamespace
```

### Resource Types

```PowerShell
#Requires -Modules @{ ModuleName="Az.Resources"; ModuleVersion="0.3.0" }
Get-AzResourceProvider -ProviderNamespace Microsoft.Compute |
    Select-Object ResourceTypes, Locations |
    Sort-Object ResourceTypes
```

### Azure Resource Manager REST APIs

`https://management.azure.com/subscriptions/{subscription-id}/providers/{provider-name}?&api-version={api-version}`

```PowerShell
param ( [Parameter(Mandatory=$true)] $SubscriptionName, $ProviderName = 'Microsoft.Compute',
$ResourceTypeName = 'virtualMachines')

$apiVersions = ((Get-AzResourceProvider -ProviderNamespace $ProviderName).ResourceTypes | Where-Object {$_.ResourceTypeName -eq $ResourceTypeName}).ApiVersions

$subcriptions = Get-AzSubscription -SubscriptionName $SubscriptionName

$uri = 'https://management.azure.com/subscriptions/{0}/providers/{1}?&api-version={2}' -f $subcriptions[0].SubscriptionId, $providerName, $apiVersions[0]

Invoke-WebRequest -Method Get -Uri $Uri
```

Source:

- [docs](https://docs.microsoft.com/en-us/rest/api/resources/deployments/validate)
- [msdn](https://msdn.microsoft.com/en-us/library/azure/dn790568.aspx)

## Source

[Pluralsight: Mastering Microsoft Azure Resource Manager - by James Bannan](https://app.pluralsight.com/library/courses/microsoft-azure-resource-manager-mastering/table-of-contents)

# ARM

## Installation

[Installation Guide](https://docs.microsoft.com/en-us/powershell/azure/install-azurerm-ps?view=azurermps-6.10.0)

```PowerShell
Install-Module -Name AzureRM -AllowClobber
```

## Login

```PowerShell
# Import the module into the PowerShell session
Import-Module AzureRM
# Connect to Azure with an interactive dialog for sign-in
Connect-AzureRmAccount
```

it is possible to the the context so you won't need to log in every time you want to use your subscription.
`Enable-AzureRmContextAutosave` see [docs](https://docs.microsoft.com/en-us/powershell/module/azurerm.profile/enable-azurermcontextautosave?view=azurermps-6.10.0)

## Funcitons

[Ensure template functions work](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates-cloud-consistency#ensure-template-functions-work)

### Function Add

Run the `add.json` ARM template to add two parameters. This demonstrate the ARM function functionality. To run the Add-ARM use:

```PowerShell
.\deploy.ps1
# 2
```

Specify the parameters by using a hashmap `@{ first = 1; second = 1}`

```PowerShell
.\deploy.ps1 -TemplateParameterObject = @{ first = 5; second = 6}
# 11
```

Try [code](deploy.ps1)
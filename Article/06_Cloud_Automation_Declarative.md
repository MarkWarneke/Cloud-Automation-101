# Cloud Automation Declarative [<](05_Cloud_Automation_Software_Testing.md) [>](07_Cloud_Automation_DevOps.md)

## Table of content

- [Cloud Automation Declarative < >](#cloud-automation-declarative--)
    - [Table of content](#table-of-content)
    - [Introduction](#introduction)
    - [Declarative vs Imperative](#declarative-vs-imperative)
    - [Snippets](#snippets)
        - [VSCode ARM Snippets](#vscode-arm-snippets)
    - [Installation AzureRm Module](#installation-azurerm-module)
    - [Login](#login)
- [Import the module into the PowerShell session](#import-the-module-into-the-powershell-session)
- [Connect to Azure with an interactive dialog for sign-in](#connect-to-azure-with-an-interactive-dialog-for-sign-in)
    - [Azure Resource Manager Template](#azure-resource-manager-template)
    - [Azure Resource Manager Quick Start Templates Collection](#azure-resource-manager-quick-start-templates-collection)
    - [ARM Compose](#arm-compose)
    - [ARM Functions](#arm-functions)
        - [Example Function Add](#example-function-add)
- [2](#2)
- [11](#11)
    - [ARM Linked Templates](#arm-linked-templates)
    - [ARM Nested Templates](#arm-nested-templates)
    - [ARM Deployment Order](#arm-deployment-order)
        - [Azure Resource Explorer](#azure-resource-explorer)
    - [Links](#links)

## Introduction

TODO: tbd

## Declarative vs Imperative

TODO: tbd

## Snippets

Custom snippets with [VSCode snippets](https://code.visualstudio.com/docs/editor/userdefinedsnippets)

[Vscode Extension: Azure Resource Manager Templates](https://marketplace.visualstudio.com/items?itemName=samcogan.arm-snippets), open source from Sam Cogan from [azure-xplat-arm-tooling](https://github.com/Azure/azure-xplat-arm-tooling)

### VSCode ARM Snippets

Define your own VSCode snippets by pressing CTRL + Shift + P -> Preferences: Configure User Snippets

```JSON
"Azure Resource Manager Basic Template": {
    "prefix": "arm",
    "body": [
        "{",
        "    \"\\$schema\": \"http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#\",",
        "    \"contentVersion\": \"\",",
        "	/*",
        "        PARAMETER BLOCK",
        "        ",
        "    */",
        "    \"parameters\": {  },",
        "	/*",
        "        VARIABLES BLOCK",
        "        ",
        "    */",
        "    \"variables\": {  },",
        "	/*",
        "        FUNCTIONS BLOCK",
        "        ",
        "    */",
        "    \"functions\": [  ],",
        "	/*",
        "        RESOURCES BLOCK",
        "        ",
        "    */",
        "    \"resources\": [  ],",
        "	/*",
        "        OUTPUTS BLOCK",
        "        ",
        "    */",
        "    \"outputs\": {  }",
        "}"
    ]
}
```

## Installation AzureRm Module

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

It is possible to the the context so you won't need to log in every time you want to use your subscription.
`Enable-AzureRmContextAutosave` see [docs](https://docs.microsoft.com/en-us/powershell/module/azurerm.profile/enable-azurermcontextautosave?view=azurermps-6.10.0)

## Azure Resource Manager Template

[Azure Resource Manager Template](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authoring-templates)

```JSON
{
    "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
    "contentVersion": "",
    "parameters": {  },
    "variables": {  },
    "functions": [  ],
    "resources": [  ],
    "outputs": {  }
}
```


- [Get Started Blog](https://blogs.msdn.microsoft.com/azuredev/2017/05/06/iac-on-azure-how-to-get-started-with-arm-template/)
- [Understand the structure and syntax of Azure Resource Manager Templates](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authoring-templates)
- [Quickstart: Create and deploy Azure Resource Manager templates by using the Azure portal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-manager-quickstart-create-templates-use-the-portal)

## Azure Resource Manager Quick Start Templates Collection

- [Azure Quickstart Templates](https://azure.microsoft.com/en-us/resources/templates/)

## ARM Compose

How to structure and design your ARM templates.

- Naming Convention
- Parameter
- Components
- Functions
- Outputs


TODO: TBD

## ARM Functions

[ARM Functions](https://github.com/Azure/azure-docs-json-samples/tree/master/azure-resource-manager/functions)

### Example Function Add

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

Try [code](..\Code\ARM\deploy.ps1)

## ARM Linked Templates

[Using linked and nested templates when deploying Azure resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-linked-templates)

TODO: TBD

## ARM Nested Templates

[Using linked and nested templates when deploying Azure resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-linked-templates)

TODO: TBD

## ARM Deployment Order

 [Define the order for deploying resources in Azure Resource Manager Templates](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-define-dependencies)

TODO: TBD

### Azure Resource Explorer

Find more about your existing infrastructure by using the Resource Explorer

- [Azure Resource Explorer](https://resources.azure.com/)


## Links

[**Next** Cloud Automation DevOps](07_Cloud_Automation_DevOps.md)

- [Table of contents](README.md)
- [Home](../README.md)
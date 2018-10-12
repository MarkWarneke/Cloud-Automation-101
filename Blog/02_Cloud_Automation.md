# Cloud Automation Basics

## Table of content

- Azure Automation Account
- Azure Automation Account Assets
- Azure Runbook
- Azure Workflows
- Azure Resource Manager Template

## Azure Automation Account

TODO: Include Automation Account details

### Azure Automation Account Assets

- Schedules `Get-AzureRmAutomationSchedule`
- Modules `Get-AzureRmAutomationModule`
- Certificates `Get-AutomationCertificate`
- Connections `Get-AutomationConnection`
- Variabels `Get-AzureAutomationVariable`
- Credentials `Get-AzureAutomationCredential`


## Azure Runbook

TODO: Describe runbook and demo

## Azure Workflows

By design, workflows can be long-running, repeatable, frequent, parallelizable, interruptible, stoppable, and restartable. They can be suspended and resumed; they can also continue after an unexpected interruption, such as a network outage or computer restart. Follwoing are some of the many benefits of using workflows:

## Azure Resource Manager Template

```JSON
{
    "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",

    "contentVersion": "1.0.0.0",

    "parameters": { },

    "variables": { },

    "resources": [ ],

    "outputs": { }
}
```

- **$Schema:** Location of the JSON schema file that describes the version of the template language.
- **contentVersion:** Version of the template (such as 1.0.0.0).
- **parameters:** Optional values that are provided when deployment is executed to customize resource deployment.
- **resources:** A manageable item that is available through Azure. Some common resources are a virtual machine, storage account, web app, database, and virtual network, but there are many more.
- **outputs:** Values that are returned after deployment


## Next

[Cloud Automation Advanced](03_Cloud_Automation.md)
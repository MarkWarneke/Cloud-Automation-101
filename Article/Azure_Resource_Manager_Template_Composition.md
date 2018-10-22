# Template Composition

- Why compose templates
- share outputs between one or more templates
- nested deployments
- store secrets secure
- link shared templates
- deploy nested

## Composition Theory

You are composing one template into its own template, which makes it smaller and reusable as a referenced templates by leveraging the  `Microsoft.Resources/deployments` Provider. Going for a `"god-template"` that specifies every component by its provider like:

```JSON
# azureDeploy.json
"resources" : [
    Microsoft.Storage/storageAccounts
    Microsoft.Network/virtualNetworks
    Microsoft.Compute/virtualMachines
]
```

To a master template that orchestrates multiple deployments. Each of which are responsible for a certain component of the solution, e.g. `storageAccount`, `virtualNetwork` and `virtualMachine` and a just referenced by the `Microsoft.Resources/deployments` Provider.

```JSON
# azureDeploy.json
"resources" : [
    Microsoft.Resources/deployments # storageAccount.json
    Microsoft.Resources/deployments # virtualNetwork.json
    Microsoft.Resources/deployments # virtualMachines.json
]
```

```JSON
# storageAccount.json
"resources" : [
     Microsoft.Storage/storageAccounts
]
```

```JSON
# virtualNetwork.json
"resources" : [
     Microsoft.Network/virtualNetworks
]
```

```JSON
# virtualMachines.json
"resources" : [
     Microsoft.Compute/virtualMachines
]
```

## Output

Composed templates need to *communicate* with each other you can use the `outputs` property of the ARM template.

```JSON
"outputs" : {
    "key" : {                                   # key of the output, e.g. virtualMachineName
        "type" : "string",                      # type of the value, e.g. string or int
        "value" : "[variable('variableKey')]"   # value of the output, e.g. specified variable or parameter / resource
    }
}
```

The master template can use the returned value of the composed template to make further use of the output or pass that to a shared template.

You can access the outputs within a template by using the `.outputs.key.value` of a reference, where you provide a composed child template as the parameter and the outputs key as the specified key property in the child template outputs property.

```JSON
# nestedDeploymentvirtualMachine
"outputs" : {
    "virtualMachineName" : {
        "type" : "string",
        "value" : "[variable('virtualMachineName')]"
    }
}
```

```JSON
# Master
"parameters" : {
    "virtualMachineName" : {
        "value" : "[reference(parameter('nestedDeploymentvirtualMachine')).outputs.virtualMachineName.value]"
    }
}
```

## Composition Demo

```JSON
"resources" : [
    {
        "apiVersion": "[vairables('deploymentApiVersion')]",            # earlier specified apiVersion
        "name" : "[parameters('nestedDeploymentResource')]",            # name of the nested deployment files for resource
        "type" : "Microsoft.Resource/deployments",                      # Provider for composed child arm template file
        "properties" : {
            "mode" : "Incremental",                                     # Incremental: only changes gets deployed
            "templateLink" : {
                "uri" : "[concat(parameters('baseTemplateUri'), '/shared/', parameters('sharedTemplateNameResource'))]",
                                                                        # url to the child template,
                                                                        # gets composed of the url of the current template provided as a parameter a folder '/shared/'
                                                                        # and the name of the child template provided by a parameter
                "contenVerison": "1.0.0.0"
            },
            {
                "parameters" {                                          # specify a list of parameters that are needed for the nested template
                    "key" : { "value" : "[parameters('key')]" },        # provide value for the parameter by referencing own parameters
                    ... #
                }
            }
        }
    }
]

```

When using outputs of a nested deployment you should implement the `depensdOn` property within te `Microsoft.Resource/deployments`

```JSON
{
    "apiVersion": "[vairables('deploymentApiVersion')]",
    "name" : "[parameters('nestedDeploymentDependendResource')]",
    "type" : "Microsoft.Resource/deployments",
    "dependsOn" : [                                                 # list of predecessor deployments as dependencies
        "[concat('Microsoft.Resource/deployment', parameters('nestedDeploymentPredecessor'))]",
                                                                    # concat to get  the resource name specified earlier
        "..."
    ]
    "properties" : {
"..." : "...",                                                      # see above, mode, templateLink etc.
        {
            "parameters" : {
                "key" : { "value" : "[reference(parameters('nestedDeploymentPredecessor')).outputs.key.value]" },
                                                                    # notice the outputs.key.value as discussed earlier
            }
        }
    }
}
```

## Secrets


## Source

[World Class ARM Templates](http://download.microsoft.com/download/8/E/1/8E1DBEFA-CECE-4DC9-A813-93520A5D7CFE/World%20Class%20ARM%20Templates%20-%20Considerations%20and%20Proven%20Practices.pdf)
[Understand the structure and syntax of Azure Resource Manager Templates](https://azure.microsoft.com/en-us/documentation/articles/best-practices-resource-manager-design-templates/)
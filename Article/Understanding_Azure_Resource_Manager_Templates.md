# Understanding Azure Resource Manager Template

## Core Structure of ARM Templates

Resources uses square instead of curly braces, because you want to deploy a variety of resources.

## Azure Resource Manager Templates Schemas

[Github: azure-resource-manager-schemas](https://github.com/Azure/azure-resource-manager-schemas)

## Parameter, Variables and Resources

## Parameters

```JSON
{
    "key" : {                       # flexible key like 'vmName'
        "type" : "string",          # mandatory
        "defaultValue" : "..",      # flexible, throws error if not specified
        "allowedValues": [          # Validation for values provided, throws error
            "value1",
            ".."
        ],
        "metadata": {
            "description" : "..."   # Human readable description, should be set
        }
    }
}
```

Values by parameters file can be provided by a simpler parameter file

```JSON
{
"$schema" : "..",
    "contentVersion" : "1.0.0.0",
    "parameters" : {
        "key" : {                   # flexible key like 'vmName'
            "value": "value1"       # can not be encrypted secure string!
        },
        "key2" : {
            "value" : "value2"
        }
    }
}
```

## Variables

```JSON
"variables" : {
    "vnetID" : "[resourceId('Microsoft.Network/virtualNetworks' , parameters('virtualNetworkName'))]", # gets the resource id of virtual network with the name of virtualNetowrkName parameter
    "subnetRef": "[concat(variables('vnetID'), '/subnets/', parameters('subnetName'))]" # uses a function concat to append three strings, the earlier defined variable of the virtual network resource id with the lateral string '/subnets/' and the provided parameter subnetName
}
```

## Complex Variable Constructs

You can define complex variables like a HashMap/Dictionary with key value pairs.

```JSON
"variables": {
    "environmentSettings": {
        "test": {
            "instanceSize": "Small",
            "instanceCount": 1
        }
    }
}
```

So you can access the complex variables using dot notation.

```JSON
"[variables('environmentSettings').test.instanceSize]"
```

You can combine this with a parameter provided to the ARM template. To make decicions in the code flexible.

```JSON
"[variables('environmentSettings')[parameters('environmentName')].instanceSize]"
```

## Resources

```JSON
"resources" : [
    {
        "type" : "Microsoft.Storage/storageAccounts",
        "name": "[parameters('StorageAccountName')]", # every resource needs a name, names should be flexible defined by the user through a parameter
        "apiVersion" : "...",
        "location": "[ResourceGroup().locaiton]", # can be passed as a parameter, but ResourceGroup location can be reused too
        "properties" : { # different resources have one or more specific properties which ARM needs values for in order to complete deployment
            "accountType" : "[parameters('storageAccountType')]" # can be specified as a parameter e.g. with a default value
        }
    }
]
```

### Multiple Resources

If you want to deploy multiple resources you can use the `copy` property of a resource entry. You can leverage `copyIndex()`as an enumerator for the count value.

```JSON
"resources" : [
    {
        "name" : "[concat(..., copyIndex())]", # name and type of resource, concat with a copyIndex , if provided but no copy property the section is invalid
        "type" : "...",
        "apiVersion" : "...",
        "location": "...",
        "copy" : {
            "name": "myCopyResource", # give this copy function a name
            "count" : "[parameters('count')]" # specify times of copy, e.g. in parameter

        }
    }
]
```

# Naming

Naming and naming conventions should be simple and consider limitation. KISS is the keyword (Keep it simple, stupid) to not add unnecessary complexity but creating consistency and readability to generate clarity.

[Docs: Naming conventions](https://docs.microsoft.com/en-us/azure/architecture/best-practices/naming-conventions)

## Limitations Examples

- Storage Groups
  - cannot exceed 24 characters
  - must be lowercase
  - no hyphens
- Windows
  - cannot exceed 15 characters

Global Unique Naming

- Azure Storage
- Web Apps
- Azure Key Vault
- Redis Cache
- Traffic Manager
- ...

## Convention by template

```JSON
{
  "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters":{
    "Prefix":{
        "type":"string",
        "maxLength":2
    },
    "Suffix":{
        "type":"string",
        "maxLength":1
    },
    "location":{
        "type":"string",
        "maxLength":2
    }
  },
  "variables":{    "nameconvention":"[concat(parameters('Prefix'),parameters('location'),parameters('Suffix'))]"
  },
  "resources":[
    ],
    "outputs":{
      "name" : {
        "type" : "string",
        "value": "[variables('nameconvention')]"
      }
    }
 }
```

## Source

- [Youtube: Deploy Infrastructure As A Service with Azure Resource Manager Templates by Will Anderson](https://www.youtube.com/watch?v=fY62tqENNw4)
- [Blog: Best Practices For Using Azure Resource Manager Templates](https://blogs.msdn.microsoft.com/mvpawardprogram/2018/05/01/azure-resource-manager/)

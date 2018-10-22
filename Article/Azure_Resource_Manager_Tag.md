# Tag

To add tags you can use the `Set-AzResource` with a tag using the parameter `-tag`. You can get different resources by querying all resources with `Get-AzResource` and searching it with `Where-Object` and a designed filter query.

```PowerShell
$Name = ".."
# Get resources to be tagged
$resources = Get-AzResource | Where-Object { $_.Name -like $Name }

# Define tags as a hashtable
$tag = @{
    department : "it"
    environment : "prod"
}

foreach ($resource in $resources) {
    Set-AzResource -Tag $tag -ResourceId $resource.ResourceId # -force
}
```

# Azure Resource Manager Policies

Naming conventions can be enabled through Policies. It's an explicit allow or deny statement.

Basic structure consisting of `if` and `then` block.

```JSON
{
    "if" : {...},
    "then" : {...}
}
```

Can use Operators like `Not`, `ANd` or `Or`.
And field `Name`, `Kind`, `Type`, `Location`, `Tags`, `Alias`.
ANd Condition `Equals`, `Like`, `Contains`, `In`, `ContainsKey`
And Effect `Deny`, `Audit`, `Append`

```JSON
# Policy to only allow resources to be deployed in location 'westeurope' and ...
{
    "if" : {
        "not" : {                       # Example Operator:  not
            "field" : "location",       # Example Field: Location
            "in" : ["westeurope", ".."] # Example Condition: in
        }
    }
    "then" : {
        "effect" : "deny"               # Example Effect: deny
    }
}
```
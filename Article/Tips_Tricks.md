
# Tips and Tricks for ARM templates

## How to save time intensive output state and reuse for debugging (ARM template outputs debugging)

If you want to troubleshoot a time intensive output and save the state you can leverage export-clixml. For ARM templates that would be

```PowerShell
# Deploy actual arm template or time intensive task then generates an object to reuse
$Deploy = New-AzureRmResourceGroupDeployment ....

# save the state by serializing the object to xml
$Deploy | Export-Clixml $Home\state.xml
```

after that you can use the `state.xml` to retrieve the objects and all of their properties.

```PowerShell
# load time intensive object from serialized state
$session = Import-Clixml $home\state.xml
```

That will allow you to troubleshoot the output without rerunning the whole script until this point.
In debug mode you are able to export the output of a script at runtime at a specific place and time, too.

## Map Outputs from an Am Template to a custom object

```PowerShell
# get enumerator from stored session output
$enum = $session.GetEnumerator()

# prepare custom object
$return = [PSCustomObject]@{}

# uses enumerator to iterate through the output
while($enum.MoveNext()) {
    # get current object from enumerator
    $current = $enum.Current
    # add properties to object based on key and use the value as value value (see outputs structure in ARM) objects might need to be handled differently
    $return | Add-Member -MemberType NoteProperty -Name $current.Key -Value $current.Value.Value
}
# return constructed object
$return
```

An example implementation could look like the following code sample. However 

```PowerShell
function Get-DeploymentOutput {
    <#
        .SYNOPSIS
            Takes Outputs from Arm Template deployment and generates a pscustomobject.

        .NOTES
            Outputs is Dictionary`2  needs enumerator
            Output value has odd value key again -> $output.Value.Value

            [DBG]: PS C:\dev> $$Output.GetType()
            Dictionary`2

            [DBG]: PS C:\dev> $output

            Key              Value
            ---              -----
            virtualMachineId Microsoft.Azure.Commands.ResourceManager.Cmdlets.SdkModels.DeploymentVariable

            [DBG]: PS C:\dev> $output.Value

            Type   Value
            ----   -----
            String /subscriptions/*/resourceGroups/*/providers/Microsoft.Compute/virtualMachines/*

            $output.value.value
    #>
    [CmdletBinding()]
    param(
        $Outputs
    )

    if (-Not $Outputs) {
        Write-Error "[$(Get-Date)] Deployment output can not be parsed ´n $Deployment"
        return
    }
    else {
        try {
            $return = [PSCustomObject]@{}
            $enum = $Outputs.GetEnumerator()

            while ($enum.MoveNext()) {
                $current = $enum.Current
                $return | Add-Member -MemberType NoteProperty -Name $current.Key -Value $current.Value.Value
            }
            $return
        }
        catch {
            Write-Verbose "[$(Get-Date)] Unable to parse"
            return $Outputs
        }
    }
}
```
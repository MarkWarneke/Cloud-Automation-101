# Runbook

- [Azure Automation runbook](https://docs.microsoft.com/en-us/azure/automation/automation-runbook-types)
- [Starting a runbook in Azure Automation](https://docs.microsoft.com/en-us/azure/automation/automation-starting-a-runbook)

## Starting A Runbook

```PowerShell
Start-AzureRmAutomationRunbook -AutomationAccountName "MyAutomationAccount" -Name "Test-Runbook" -ResourceGroupName "ResourceGroup01"
```

## Graphical Runbook

- [Graphical runbook](https://docs.microsoft.com/en-us/azure/automation/automation-first-runbook-graphical)

## Introduction To PowerShell

- [PowerShell](https://docs.microsoft.com/en-us/powershell/scripting/powershell-scripting?view=powershell-6)
- [Getting Started](https://github.com/PowerShell/PowerShell/tree/master/docs/learning-powershell)
- [Installation](https://github.com/powershell/powershell)

> PowerShell is a task-based **command-line shell** and **scripting language** **built on .NET**. PowerShell helps system administrators and power-users can rapidly automate tasks that manage operating systems (Linux, macOS, and Windows) and processes.

**Design Goals**

>PowerShell is designed to improve the command-line and scripting environment by eliminating long-standing problems and adding new features.

- Discoverability
- Consistency
- Interactive and scripting environments
- Object orientation
- Easy transition to scripting

## About pages

About pages are help files to give you fundamental PowerShell help. See [About](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/?view=powershell-6)

```PowerShell
Get-Help about_pipelines
# TOPIC
#    about_pipelines
#
#SHORT DESCRIPTION
#    Combining commands into pipelines in the Windows PowerShell
```

## Advanced Funcitons

> Advanced functions allow you to write functions that can perform operations that are similar to the operations you can perform with cmdlets.

[About Functions Advanced (about_functions_advanced)](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced?view=powershell-6)

```PowerShell
function Send-Greeting
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string] $Name
    )

    Process
    {
        write-host ("Hello " + $Name + "!")
    }
}

# Invoke the function
Send-Greeting
```

## Advanced Parameters

>you can add parameters to the advanced functions that you write, and use parameter attributes and arguments to limit the parameter values that function users submit with the parameter.

[About Functions Advanced Parameters (about_functions_advanced_parameters)](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters?view=powershell-6)

```PowerShell
Param(
    [parameter(
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true,
            ParameterSetName = 'Default',
            HelpMessage = "Name of Color - e.g. Red"
    )]
    [ValidateNotNullOrEmpty()]
    [ValidateSet("Red", "Blue")]
    [Alias("C")]
    [String]
    $Color
)
```
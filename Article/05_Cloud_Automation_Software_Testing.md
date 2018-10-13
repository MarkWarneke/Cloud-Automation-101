# Cloud Automation Software Testing [<](04_Cloud_Automation_Version_Control.md) [>](06_Cloud_Automation_Declarative.md)

## Table of content

- [Cloud Automation Software Testing < >](#cloud-automation-software-testing--)
    - [Table of content](#table-of-content)
    - [Introduction](#introduction)
        - [Unit Test](#unit-test)
        - [Integration Test](#integration-test)
        - [System Test](#system-test)
    - [Tools](#tools)
    - [Pester](#pester)
        - [Install Pester](#install-pester)
        - [Demonstration Pester](#demonstration-pester)
        - [Assertion](#assertion)
        - [Tips for working with Azure Resources](#tips-for-working-with-azure-resources)
            - [Should](#should)
                - [Throw](#throw)
                - [BeOfType](#beoftype)
- [Checks Type](#checks-type)
        - [General Tips](#general-tips)
    - [Links](#links)

## Introduction

Levels, Unit, Integration, System, Acceptence

### Unit Test

Per function

### Integration Test

Components together

### System Test

Complete System

## Tools

- PowerShell Unittest [Pester](https://github.com/pester/Pester)
- Python Unittest [unittest](https://docs.python.org/3/library/unittest.html)

## Pester

Pester is the ubiquitous test and mock framework for PowerShell.
Link to [Pester](https://github.com/pester/Pester)

### Install Pester

```PowerShell
Install-Module -Name Pester -Force -SkipPublisherCheck
```

### Demonstration Pester

Run Test. You can also invoke your test by running `Invoke-Pester $Path`.

```PowerShell
Code\Pester\Test-Division.ps1
```

Test it here [Code](..\Code\Pester\Test-Division.ps1)

### Assertion

Example of how to do assertions. You can use the Pipe "|" and Should function to test the output.

```PowerShell
Describe 'Notepad' {
    It 'Exists in Windows folder' {
        'C:\Windows\notepad.exe' | Should -Exist
    }
}
```

### Tips for working with Azure Resources

Use a generated timestamp to avoid resources to be accidentally deleted by removing the ResourceGroup.
Create a dedicated ResourceGroup that you are able to delete after your test case.
You can use the Get-Date to create a unique name, but provide a naming convention for dedicated testing groups.

```PowerShell
(Get-Date -Format FileDateTime)
```

Use the capability of `BeforeEach` and `AfterEach` or (`BeforeAll` and `AfterAll` for cleanup).
Be sure to have the session connected to your Azure subscriptiong `Connecet-AzureRmAccount`

```PowerShell
Connect-AzureRmAccount

Describe "how to clean up" {
    $TestResourceGroupName = "AUTOTEST-$(Get-Date -Format FileDateTime)"
    $Location = 'WestEurope'

    BeforeEach {
        Write-Host "Create Test ResourceGroup $TestResourceGroupName..." -ForeGroundColor Blue
        New-AzureRmResourceGroup -Name $TestResourceGroupName -Location $Location | Out-Null
        Write-Host "Test started." -ForeGroundColor Blue
    }

    it "should cleanup" { "A" | Should Be "A" }

    AfterEach {
        Write-Host "Remove ResourceGroup $TestResourceGroupName..." -ForeGroundColor Blue
        Get-AzureRmResourceGroup $TestResourceGroupName -ErrorAction SilentlyContinue | Remove-AzureRmResourceGroup -Force
        Write-Host "Test completed." -ForeGroundColor Blue
    }
}
```

Test it here [Code](\Code\Pester\Test-Cleanup.ps1)

**Notice**: Use the ForeGroundColor to distinguish the output of the test preparation / cleanup.
If you are using [PSScriptAnalyzer](https://github.com/PowerShell/PSScriptAnalyzer) you should except `PSAvoidUsingWriteHost`

A naming convention for ResourceGroups that are created for a test makes it easier to remove them later.
To remove all ResoruceGroups you can just search for them based on the naming convention.

```PowerShell
    $NamingConvention = "AUTOTEST-" # All ResourceGroups for automated testing start with "AUTOTEST-"
    Get-AzureRmResourceGroup -Name "$NamingConvention*" | Remove-AzrueRmResourceGroup # -Force
```

#### Should

See the [Pester Wiki](https://github.com/pester/Pester/wiki) to learn about other assertions that you can use like: `Be`, `BeExactly`, `BeLike`, `BeOfType`, `BeTrue`, `Exist`, `Throw`

Some examples I frequently use.

##### Throw

If you want to ensure your script is validateing your parameters e.g. when using [Parameter and Variable Validations Attributes](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters?view=powershell-6#parameter-and-variable-validation-attributes) like [[ValidateSet](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters?view=powershell-6#validateset-attribute)("Blue", "Red")] to get a nice autocomplete feature. Use a Parameter test.

```PowerShell
 # Returns Color
function My-Function {
    param( [ValidateSet("Blue", "Red")] $Color )
    $Color
}

Describe "My-Function Parameter" {
    It "should throw when value does not match" {
        { My-Function "green" } | should throw
    }
```

Notice the **curly braces around the function call** My-Function in order to assert the throw.

##### BeOfType

To test if a particular type is returned for instance when testing AzureResources you can use `BeOfType` assertion.

```PowerShell
# Checks Type
Describe "New-AzureRmResourceGroup Type" {
    $ResourceGroupName = (Get-Date -Format FileDateTime)

    It "should be of type PSResourceGroup" {
        New-AzureRmResourceGroup -Name $ResourceGroupName -Location 'WestEurope' | Should BeOfType "Microsoft.Azure.Commands.ResourceManager.Cmdlets.SdkModels.PSResourceGroup"
    }

    AfterEach { Remove-AzureRmResourceGroup -Name $ResourceGroupName # -Force
    }
}
```

Test it here [Code](\Code\Pester\Test-BeOfType.ps1)

### General Tips

> all Pester test scripts must end with .Tests.ps1 in order for Invoke-Pester to run them


## Links

[**Next** Cloud Automation Declarative](06_Cloud_Automation_Declarative.md)

- [Table of contents](README.md)
- [Home](../README.md)
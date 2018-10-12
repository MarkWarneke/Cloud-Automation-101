# Pester
Link to [Pester](https://github.com/pester/Pester)


## Install

```PowerShell
Install-Module -Name Pester -Force -SkipPublisherCheck
```

## Demonstration

Run Test

```PowerShell
.\Test-Devision.ps1
```

## Assertion

```PowerShell
Describe 'Notepad' {
    It 'Exists in Windows folder' {
        'C:\Windows\notepad.exe' | Should -Exist
    }
}
```


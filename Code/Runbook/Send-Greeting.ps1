function Send-Greeting {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string] $Name
    )

    Process {
        write-host ("Hello " + $Name + "!")
    }
}

Send-Greeting
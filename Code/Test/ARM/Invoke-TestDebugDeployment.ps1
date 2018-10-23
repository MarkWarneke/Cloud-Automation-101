function Test-ArmTemplate {

    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullorEmpty()]
        [object]
        $TemplateFile,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullorEmpty()]
        [HashTable]
        $templateParameterObject,

        [string]
        $Name = 'testdeployment'
    )

    $debugpreference = "Continue"

    $rawResponse = Test-AzureRmResourceGroupDeployment -ResourceGroupName $Name `
        -TemplateFile $TemplateFile.FullName `
        -TemplateParameterObject $TemplateParameterObject `
        -ErrorAction Stop 5>&1

    $debugpreference = "SilentlyContinue"

    $deploymentOutput = ($rawResponse.Item(32) -split 'Body:' | Select-Object -Skip 1 | ConvertFrom-Json).properties

    return $deploymentOutput
}
# REQUIRES Module AzureRm

param ( $ResourceGroupName = 'Test', $TemplateFile = 'add.json', $TemplateParameterObject = @{ first = 1; second = 1}  )

$ResourceGroup = Get-AzureRmResourceGroup $ResourceGroupName 
if (! $ResourceGroup) {
    Write-Host "Create ResourceGroup $ResourceGroupName" -ForegroundColor Blue
    New-AzureRmResourceGroup -Name $ResourceGroupName -Location 'WestEurope'
}

(New-AzureRmResourceGroupDeployment -ResourceGroupName 'test' -TemplateFile $TemplateFile -TemplateParameterObject $TemplateParameterObject).OutPuts.addResult.Value
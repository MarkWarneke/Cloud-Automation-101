Describe "New-AzureRmResourceGroup Type" {
    $ResourceGroupName = (Get-Date -Format FileDateTime)

    It "should be of type PSResourceGroup" {
        New-AzureRmResourceGroup -Name $ResourceGroupName -Location 'WestEurope' | Should BeOfType "Microsoft.Azure.Commands.ResourceManager.Cmdlets.SdkModels.PSResourceGroup"
    }

    AfterEach { Remove-AzureRmResourceGroup -Name $ResourceGroupName # -Force
    }
}